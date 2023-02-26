import 'package:flutter/material.dart';

import '../../entity/pos/deals_entity.dart';
import '../../widgets/code_value_dropdown.dart';
import '../../widgets/widgets.dart';

class RuleBuilder extends StatelessWidget {
  const RuleBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const RuleBuilderCondition(condition: "OR"),
    );
  }
}

class RuleBuilderCondition extends StatelessWidget {
  final String condition;
  const RuleBuilderCondition({Key? key, required this.condition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
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
                      ConditionRuleWidget(),
                      ConditionRuleWidget(),
                      ConditionRuleWidget(),
                      ConditionRuleWidget(),
                      ConditionRuleWidget(),
                      ItemTest(),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          RuleButton(
                            icon: Icons.add,
                            text: "Add Group",
                            onTap: () {
                              print("Add Group");
                            },
                          ),
                          const SizedBox(width: 10),
                          RuleButton(
                            icon: Icons.filter_alt,
                            text: "Add Filter",
                            onTap: () {
                              print("Add Filter");
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
          Container(
            constraints: const BoxConstraints(minHeight: 200),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemConditionBuilder(),
                  ItemConditionBuilder(),
                  ItemConditionBuilder(),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      RuleButton(
                        icon: Icons.filter_alt,
                        text: "Add New Item Rule.",
                        onTap: () {
                          print("Add New Item Rule.");
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemConditionBuilder extends StatelessWidget {
  const ItemConditionBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200,
                child: CustomDropDown<MatchingField>(
                  label: "Condition",
                  onChanged: (val) {},
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
                width: 250,
                child: CustomDropDown<MatchingRule>(
                  label: "Rule",
                  onChanged: (val) {},
                  itemAsString: (item) {
                    return item.value;
                  },
                  asyncItems: (filter) async {
                    return MatchingRule.values;
                  },
                ),
              ),
              const SizedBox(width: 16),
              const SizedBox(
                width: 200,
                child: CustomTextField(
                  label: "Value",
                ),
              )
            ],
          ),
        ],
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
              style: TextStyle(
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
