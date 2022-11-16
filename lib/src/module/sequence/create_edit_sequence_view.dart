import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/appbar_leading.dart';
import 'bloc/create_edit_sequence_bloc.dart';
import 'sequence_config_desktop_view.dart';

class CreateEditSequenceView extends StatelessWidget {
  const CreateEditSequenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateEditSequenceBloc(
        sequenceRepository: context.read(),
      )..add(FetchAllSequence()),
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [
                const Positioned(
                  top: 75,
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: SequenceConfigView(),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: AppBarLeading(
                    heading: "Sequence Config",
                    icon: Icons.arrow_back,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class SequenceConfigView extends StatelessWidget {
  const SequenceConfigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SequenceConfigDesktopView();
  }
}
