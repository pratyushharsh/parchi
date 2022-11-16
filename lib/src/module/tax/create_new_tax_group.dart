import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/my_loader.dart';
import 'bloc/new_tax_group_bloc.dart';

class CreateNewTaxGroupView extends StatelessWidget {
  const CreateNewTaxGroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewTaxGroupBloc(taxRepository: RepositoryProvider.of(context)),
      child: const CreateNewTaxGroupForm(),
    );
  }
}

class CreateNewTaxGroupForm extends StatelessWidget {
  const CreateNewTaxGroupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewTaxGroupBloc, NewTaxGroupState>(
      listener: (context, state) {
        if (state.status == NewTaxGroupStatus.success) {
          Navigator.of(context).pop(true);
        }
      },
      builder: (context, state) {
        if (state.status == NewTaxGroupStatus.loading) {
          return const Center(
              child: MyLoader(
            color: AppColor.color6,
          ));
        }
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Tax Group Id',
                      initialValue: state.groupId,
                      onValueChange: (value) =>
                          BlocProvider.of<NewTaxGroupBloc>(context)
                              .add(OnGroupIdChange(value)),
                    ),
                    CustomTextField(
                      label: 'Tax Group Name',
                      initialValue: state.name,
                      onValueChange: (value) =>
                          BlocProvider.of<NewTaxGroupBloc>(context)
                              .add(OnGroupNameChange(value)),
                    ),
                    CustomTextField(
                      label: 'Tax Group Description',
                      initialValue: state.description,
                      onValueChange: (value) =>
                          BlocProvider.of<NewTaxGroupBloc>(context)
                              .add(OnGroupDescriptionChange(value)),
                    ),
                  ],
                ),
              ),
            ),
            Row(children: [
              Expanded(
                child: RejectButton(
                  label: "Cancel",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: AcceptButton(
                  label: "Create New Group",
                  onPressed: state.isValid
                      ? () {
                          // Generate Tax Group
                          BlocProvider.of<NewTaxGroupBloc>(context)
                              .add(CreateNewTaxGroup());
                        }
                      : null,
                ),
              ),
            ])
          ],
        );
      },
    );
  }
}
