import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/entity.dart';
import '../../widgets/cloud_sync_widget.dart';
import '../../widgets/custom_text_field.dart';
import 'bloc/create_edit_sequence_bloc.dart';

class SequenceConfigDesktopView extends StatelessWidget {
  const SequenceConfigDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: const [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Sequences",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Sequence Detail",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
        Expanded(
          child: Row(children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: const Card(
                  elevation: 0,
                  child: SequenceList(),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Card(
                  elevation: 0,
                  child: SequenceConfigForm(),
                ),
              ),
            )
          ]),
        ),
      ],
    );
  }
}

class SequenceList extends StatelessWidget {
  const SequenceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEditSequenceBloc, CreateEditSequenceState>(
      builder: (context, state) {
        return Column(
          children: [
            ...state.sequences.map((sequence) =>
                Column(
                  children: [
                    SequenceTile(
                        sequence: sequence,
                        selected: state.selectedSequence == sequence),
                    const Divider(height: 0)
                  ],
                )),
          ],
        );
      },
    );
  }
}

class SequenceTile extends StatelessWidget {
  final SequenceEntity sequence;
  final bool selected;

  const SequenceTile({Key? key, required this.sequence, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<CreateEditSequenceBloc>(context).add(
          SelectSequenceEntityEvent(sequence),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: selected ? AppColor.formInputBorder : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(sequence.name.value),
            CloudSyncIcon(
              syncState: sequence.syncState ?? 0,
            )
          ],
        ),
      ),
    );
  }
}


class SequenceConfigForm extends StatelessWidget {
  const SequenceConfigForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEditSequenceBloc, CreateEditSequenceState>(
      builder: (context, state) {
        if (state.selectedSequence == null) {
          return const Center(
            child: Text("Select a sequence to edit"),
          );
        }

        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                label: "Sequence Pattern",
                initialValue: state.selectedSequence!.pattern,
                onValueChange: (value) {
                  BlocProvider.of<CreateEditSequenceBloc>(context).add(
                    OnPatternChangeEvent(value),
                  );
                },
              ),
              Text("Sample Sequence:\t\t ${state.sampleSequence}"),
            ],
          ),
        );
      },
    );
  }
}
