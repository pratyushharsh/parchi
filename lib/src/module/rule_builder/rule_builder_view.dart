import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/deals_entity.dart';
import '../../util/text_input_formatter/custom_formatter.dart';
import '../../widgets/code_value_dropdown.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/widgets.dart';
import 'bloc/rule_builder_bloc.dart';

class RuleBuilder extends StatelessWidget {
  const RuleBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RuleBuilderBloc(),
      child: const RuleBuilderCard(),
    );
  }
}

class RuleBuilderCard extends StatelessWidget {
  const RuleBuilderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: BlocBuilder<RuleBuilderBloc, RuleBuilderState>(
                      builder: (context, state) {
                        return CustomTextField(
                          label: "Deal Code",
                          initialValue: state.dealId,
                          onValueChange: (value) {
                            context
                                .read<RuleBuilderBloc>()
                                .add(DealIdChangeEvent(value));
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: BlocBuilder<RuleBuilderBloc, RuleBuilderState>(
                      builder: (context, state) {
                        return CustomTextField(
                          label: "Deal Description",
                          initialValue: state.dealDescription,
                          onValueChange: (value) {
                            context
                                .read<RuleBuilderBloc>()
                                .add(DealDescriptionChangeEvent(value));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const RuleBuilderCondition(condition: "OR"),
            BlocBuilder<RuleBuilderBloc, RuleBuilderState>(
              builder: (context, state) {
                if (!state.isValid) {
                  return Container();
                }

                return SizedBox(
                  width: 200,
                  child: AcceptButton(
                    label: "Save",
                    onPressed: () {
                      // context.read<RuleBuilderBloc>().add(AddConditionEvent());
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RuleBuilderCondition extends StatelessWidget {
  final String condition;

  const RuleBuilderCondition({Key? key, required this.condition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ConditionalButton(
              condition: 'Deal',
            ),
            const SizedBox(width: 16),
            Container(
              constraints: const BoxConstraints(minHeight: 200),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DealConditionBuilder(),
                    const ItemTest(),
                    const SizedBox(height: 25),
                    BlocBuilder<RuleBuilderBloc, RuleBuilderState>(
                      builder: (context, state) {
                        if (!state.isHeaderConditionPresent) {
                          return Container();
                        }

                        return Row(
                          children: [
                            RuleButton(
                              icon: Icons.filter_alt,
                              text: "Add Filter",
                              onTap: () {
                                BlocProvider.of<RuleBuilderBloc>(context)
                                    .add(AddNewDummyConditionEvent());
                              },
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DealConditionBuilder extends StatelessWidget {
  const DealConditionBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RuleBuilderBloc, RuleBuilderState>(
      builder: (context, state) {
        return Column(
          children: [
            for (var i = 0; i < state.totalConditions.length; i++)
              TotalConditionBuilder(
                totalCondition: state.totalConditions[i],
              ),
          ],
        );
      },
    );
  }
}

class ItemTest extends StatelessWidget {
  const ItemTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          const ConditionalButton(condition: "ITEM"),
          const SizedBox(width: 16),
          BlocBuilder<RuleBuilderBloc, RuleBuilderState>(
            builder: (context, state) {
              return Container(
                constraints: const BoxConstraints(minHeight: 200),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < state.itemConditions.length; i++)
                        ItemConditionBuilder(
                          itemCondition: state.itemConditions[i],
                        ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          RuleButton(
                            icon: Icons.filter_alt,
                            text: "Add New Item Rule.",
                            onTap: () {
                              BlocProvider.of<RuleBuilderBloc>(context)
                                  .add(NewDummyItemCondition());
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ItemConditionBuilder extends StatelessWidget {
  final RuleItemCondition itemCondition;
  const ItemConditionBuilder({Key? key, required this.itemCondition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColor.background),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: AppColor.background,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 200,
                          child: CustomDropDown<MatchingField>(
                            label: "Condition",
                            onChanged: (val) {
                              if (val == null) {
                                return;
                              }
                              context.read<RuleBuilderBloc>().add(
                                  UpdateItemMatchingFieldEvent(
                                      itemCondition.uuid, val));
                            },
                            itemAsString: (item) {
                              return item.value;
                            },
                            asyncItems: (filter) async {
                              return MatchingField.values;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 300,
                          child: CustomDropDown<MatchingRule>(
                            label: "Rule",
                            onChanged: (val) {
                              if (val == null) {
                                return;
                              }
                              context.read<RuleBuilderBloc>().add(
                                  UpdateItemMatchingRuleEvent(
                                      itemCondition.uuid, val));
                            },
                            itemAsString: (item) {
                              return item.value;
                            },
                            asyncItems: (filter) async {
                              return MatchingRule.values;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 200,
                          child: CustomTextField(
                            label: "Value",
                            onValueChange: (val) {
                              context.read<RuleBuilderBloc>().add(
                                  UpdateItemMatchingValueEvent(
                                      itemCondition.uuid, val));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 150,
                          child: CustomTextField(
                            label: "Min Quantity",
                            inputFormatters: [
                              CustomInputTextFormatter.positiveNumber
                            ],
                            initialValue: itemCondition.minQty.toString(),
                            onValueChange: (val) {
                              context.read<RuleBuilderBloc>().add(
                                  UpdateItemMinQtyEvent(itemCondition.uuid,
                                      double.tryParse(val) ?? 0.0));
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 150,
                          child: CustomTextField(
                            label: "Max Quantity",
                            inputFormatters: [
                              CustomInputTextFormatter.positiveNumber
                            ],
                            initialValue: itemCondition.maxQty.toString(),
                            onValueChange: (val) {
                              context.read<RuleBuilderBloc>().add(
                                  UpdateItemMaxQtyEvent(itemCondition.uuid,
                                      double.tryParse(val) ?? 0.0));
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 200,
                          child: CustomDropDown<DealAction>(
                            label: "Action",
                            onChanged: (val) {
                              if (val == null) {
                                return;
                              }
                              context.read<RuleBuilderBloc>().add(
                                  UpdateItemActionEvent(itemCondition.uuid, val));
                            },
                            value: itemCondition.action,
                            itemAsString: (item) {
                              return item.value;
                            },
                            asyncItems: (filter) async {
                              return DealAction.values;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 200,
                          child: CustomTextField(
                            label: "Value",
                            initialValue:
                                itemCondition.action != DealAction.noAction
                                    ? itemCondition.actionValue.toString()
                                    : null,
                            inputFormatters: [
                              CustomInputTextFormatter.positiveNumber
                            ],
                            onValueChange: (val) {
                              context.read<RuleBuilderBloc>().add(
                                  UpdateItemActionValueEvent(itemCondition.uuid,
                                      double.tryParse(val) ?? 0.0));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              IconButton(
                onPressed: () {
                  BlocProvider.of<RuleBuilderBloc>(context)
                      .add(RemoveItemConditionEvent(itemCondition));
                },
                icon: const Icon(Icons.delete),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ConditionRuleWidget extends StatelessWidget {
  const ConditionRuleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 70,
                width: 400,
                child: CodeValueDropDown(
                  category: "CURRENCY",
                  onChanged: (val) {},
                  label: "Currency",
                  builder: (code) {
                    return '${code.code} - ${code.description}';
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ConditionalButton extends StatelessWidget {
  final String condition;

  const ConditionalButton({Key? key, required this.condition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: CIon(),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              condition,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CIon extends StatelessWidget {
  const CIon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const VerticalDivider(
          color: Colors.blue,
          thickness: 2,
          width: 2,
        ),
        Container(
            width: 6,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border(
                top: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
                bottom: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
            )),
      ],
    );
  }
}

class RuleButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final GestureTapCallback? onTap;

  const RuleButton(
      {Key? key, required this.icon, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey.shade600,
              size: 20,
            ),
            const SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Rule {
  final String id;
  final String type;
  final List<Rule> rules;

  Rule({
    required this.id,
    required this.type,
    required this.rules,
  });
}

enum DealHSelector {
  startDate,
  endDate,
  maximumAmountCap,
  subtotalMinimum,
  subtotalMaximum
}

class TotalConditionBuilder extends StatelessWidget {
  final RuleTotalCondition totalCondition;

  const TotalConditionBuilder({Key? key, required this.totalCondition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 400,
            child: BlocBuilder<RuleBuilderBloc, RuleBuilderState>(
              builder: (context, state) {
                return CustomDropDown<RuleTotalConditionEnum>(
                  label: "",
                  value: totalCondition.condition,
                  onChanged: (val) {
                    if (val != null) {
                      BlocProvider.of<RuleBuilderBloc>(context)
                          .add(UpdateTotalConditionEvent(totalCondition, val));
                    }
                  },
                  itemAsString: (item) {
                    return item.value;
                  },
                  asyncItems: (filter) async {
                    List<RuleTotalConditionEnum> values = [];
                    for (var cdn in RuleTotalConditionEnum.values) {
                      if (!state.containsCondition(cdn)) {
                        values.add(cdn);
                      }
                    }
                    return values;
                  },
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          const SizedBox(
            width: 200,
            child: CustomTextField(
              label: "",
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
              onPressed: () {
                BlocProvider.of<RuleBuilderBloc>(context)
                    .add(DeleteTotalConditionEvent(totalCondition));
              },
              icon: const Icon(Icons.delete_outline)),
        ],
      ),
    );
  }
}
