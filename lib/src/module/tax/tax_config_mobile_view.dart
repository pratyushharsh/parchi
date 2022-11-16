import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/cloud_sync_widget.dart';
import '../../config/theme_settings.dart';
import '../../entity/pos/tax_group_entity.dart';
import '../../entity/pos/tax_rule_entity.dart';
import '../../widgets/desktop_pop_up.dart';
import 'bloc/create_edit_tax_bloc.dart';
import 'create_edit_tax.dart';
import 'create_new_tax_group.dart';

class TaxConfigMobileView extends StatelessWidget {
  const TaxConfigMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEditTaxBloc, CreateEditTaxState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const NewTaxGroupButtonMobile(),
              ...state.taxGroups.map(
                (taxGroup) => TaxGroupCardMobile(
                  taxGroup: taxGroup,
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

class NewTaxGroupButtonMobile extends StatelessWidget {
  const NewTaxGroupButtonMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Platform.isIOS || Platform.isAndroid) {
          showTransitiveAppPopUp(
            context: context,
            child: const CreateNewTaxGroupView(),
            title: 'Create Tax Group'
          ).then((value) => {
                if (value != null && value)
                  {
                    BlocProvider.of<CreateEditTaxBloc>(context)
                        .add(FetchAllTaxGroup())
                  }
              });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: AppColor.color8,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            children: const [Icon(Icons.add), Text("Add New Tax Group")],
          ),
        ),
      ),
    );
  }
}

class TaxGroupCardMobile extends StatelessWidget {
  final TaxGroupEntity taxGroup;
  const TaxGroupCardMobile({Key? key, required this.taxGroup})
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
            children: [
              Text(
                'Tax Group: ' + taxGroup.groupId,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              CloudSyncIcon(
                syncState: taxGroup.syncState ?? 0,
              ),
            ],
          ),
          const SizedBox(height: 8),
          TaxRuleList(taxRules: taxGroup.taxRules),
          const Divider(height: 0),
          NewTaxRuleTile(
            selectedTaxGroup: taxGroup,
            padding: const EdgeInsets.symmetric(vertical: 10),
          )
        ],
      ),
    );
  }
}

class TaxRuleList extends StatelessWidget {
  final List<TaxRuleEntity> taxRules;
  const TaxRuleList({Key? key, required this.taxRules}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: taxRules
          .map((taxRule) => Column(
                children: [
                  const Divider(height: 0),
                  TaxRuleCard(taxRule: taxRule),
                ],
              ))
          .toList(),
    );
  }
}

class TaxRuleCard extends StatelessWidget {
  final TaxRuleEntity taxRule;
  const TaxRuleCard({Key? key, required this.taxRule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<TaxRuleEntity>(taxRule),
      onDismissed: (direction) {
        BlocProvider.of<CreateEditTaxBloc>(context)
            .add(DeleteTaxRule(taxRule: taxRule));
      },
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.delete, color: Colors.white),
            Icon(Icons.delete, color: Colors.white),
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Text(taxRule.ruleName!),
            const Spacer(),
            Text(taxRule.percent.toString() + "%"),
          ],
        ),
      ),
    );
  }
}
