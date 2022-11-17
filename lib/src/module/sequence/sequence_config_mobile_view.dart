import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/sequence_config.dart';
import '../../config/theme_settings.dart';
import '../../entity/pos/entity.dart';
import '../../widgets/cloud_sync_widget.dart';
import '../../widgets/desktop_pop_up.dart';
import 'bloc/create_edit_sequence_bloc.dart';
import 'sequence_config_desktop_view.dart';

class SequenceConfigMobileView extends StatelessWidget {
  const SequenceConfigMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEditSequenceBloc, CreateEditSequenceState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ...state.sequences.map(
                (sequenceGroup) => SequenceGroupCardMobile(
                  sequence: sequenceGroup,
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        );
      },
    );
  }
}

class SequenceGroupCardMobile extends StatelessWidget with SequenceConfig {
  final SequenceEntity sequence;

  const SequenceGroupCardMobile({Key? key, required this.sequence})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14, left: 16, bottom: 8, right: 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.color8,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    sequence.name.value,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(width: 6,),
                  CloudSyncIcon(syncState: sequence.syncState ?? 0)
                ],
              ),
              InkWell(
                onTap: () {
                  if (Platform.isIOS || Platform.isAndroid) {
                    showTransitiveAppPopUp(
                        context: context,
                        child: UpdateSequenceConfigView(sequence: sequence),
                        title: 'Sequence #${sequence.name.value}'
                    ).then((value) => {
                      BlocProvider.of<CreateEditSequenceBloc>(context)
                          .add(FetchAllSequence())
                    });
                  }
                },
                child: const Icon(
                  Icons.edit,
                  size: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Pattern: ${sequence.pattern}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Sample Sequence: ${generateSequence(sequence)}"),
        ],
      ),
    );
  }
}

class UpdateSequenceConfigView extends StatelessWidget {
  final SequenceEntity sequence;
  const UpdateSequenceConfigView({Key? key, required this.sequence})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CreateEditSequenceBloc(sequenceRepository: context.read())
            ..add(SelectSequenceEntityEvent(sequence)),
      child: const SequenceConfigForm(),
    );
  }
}
