import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/tax_group_entity.dart';
import '../../util/text_input_formatter/custom_formatter.dart';
import '../../widgets/address_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/my_loader.dart';
import 'bloc/new_tax_rule_bloc.dart';

class CreateNewTaxRuleView extends StatelessWidget {
  final TaxGroupEntity taxGroup;
  const CreateNewTaxRuleView({Key? key, required this.taxGroup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewTaxRuleBloc(
          taxRepository: RepositoryProvider.of(context), taxGroup: taxGroup),
      child: const CreateNewTaxRuleForm(),
    );
  }
}

class CreateNewTaxRuleForm extends StatelessWidget {
  const CreateNewTaxRuleForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewTaxRuleBloc, NewTaxRuleState>(
      listener: (context, state) {
        if (state.status == NewTaxRuleStatus.created) {
          Navigator.of(context).pop(true);
        }
      },
      builder: (context, state) {
        if (state.status == NewTaxRuleStatus.loading) {
          return const Center(
              child: MyLoader(
            color: AppColor.color6,
          ));
        }

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Rule Id',
                      initialValue: state.ruleId,
                      onValueChange: (value) =>
                          BlocProvider.of<NewTaxRuleBloc>(context)
                              .add(OnRuleIdChangeEvent(value)),
                    ),
                    CustomTextField(
                      label: 'Rule Name',
                      initialValue: state.ruleName,
                      onValueChange: (value) =>
                          BlocProvider.of<NewTaxRuleBloc>(context)
                              .add(OnRuleNameChangeEvent(value)),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'Percent',
                            initialValue: state.percent?.toString(),
                            inputFormatters: [
                              CustomInputTextFormatter.positiveNumber
                            ],
                            onValueChange: (value) =>
                                BlocProvider.of<NewTaxRuleBloc>(context).add(
                              OnPercentChangeEvent(
                                double.parse(value),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            label: 'Amount',
                            initialValue: state.amount?.toString(),
                            inputFormatters: [
                              CustomInputTextFormatter.positiveNumber
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'Minimum Taxable Amount',
                            initialValue:
                                state.minimumTaxableAmount?.toString(),
                            inputFormatters: [
                              CustomInputTextFormatter.positiveNumber
                            ],
                            onValueChange: (value) =>
                                BlocProvider.of<NewTaxRuleBloc>(context).add(
                              OnMinimumTaxableAmountChangeEvent(
                                double.parse(value),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            label: 'Maximum Taxable Amount',
                            initialValue:
                                state.maximumTaxableAmount?.toString(),
                            inputFormatters: [
                              CustomInputTextFormatter.positiveNumber
                            ],
                            onValueChange: (value) =>
                                BlocProvider.of<NewTaxRuleBloc>(context).add(
                              OnMaximumTaxableAmountChangeEvent(
                                double.parse(value),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldPlaceholderWidget(
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2200))
                                  .then((value) => {
                                        if (value != null)
                                          {
                                            BlocProvider.of<NewTaxRuleBloc>(
                                                    context)
                                                .add(
                                              OnEffectiveDateChangeEvent(value),
                                            ),
                                          }
                                      });
                            },
                            minHeight: 16,
                            value:
                                state.effectiveDateTimeStamp?.toString() ?? '',
                            label: 'Effective Date',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFieldPlaceholderWidget(
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2200))
                                  .then((value) => {
                                        if (value != null)
                                          {
                                            BlocProvider.of<NewTaxRuleBloc>(
                                                    context)
                                                .add(
                                              OnExpirationDateChangeEvent(
                                                  value),
                                            ),
                                          }
                                      });
                            },
                            minHeight: 16,
                            value:
                                state.expirationDateTimeStamp?.toString() ?? '',
                            label: 'Expiration Date',
                          ),
                        ),
                      ],
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
                  label: "Create New Rule",
                  onPressed: state.isValid
                      ? () {
                          // Generate Tax Group
                          BlocProvider.of<NewTaxRuleBloc>(context)
                              .add(CreateNewTaxRule());
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
