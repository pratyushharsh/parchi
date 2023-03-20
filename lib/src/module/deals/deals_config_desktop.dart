import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/deals_entity.dart';
import '../rule_builder/rule_builder_view.dart';
import 'bloc/create_edit_deals_bloc.dart';

class DealsConfigDesktopView extends StatelessWidget {
  const DealsConfigDesktopView({Key? key}) : super(key: key);

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
                "Deals List",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Deals Detail",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
        Expanded(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: const Card(
                      elevation: 0,
                      child: DealsList(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Card(
                      elevation: 0,
                      child: RuleBuilder(),
                    ),
                  ),
                )
              ]),
        ),
      ],
    );
  }
}

class DealsList extends StatelessWidget {
  const DealsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEditDealsBloc, CreateEditDealsState>(
      builder: (context, state) {
        return ListView(
          children: [
            ...state.deals.map((e) => DealHeaderTile(
              deal: e,
              selected: e.dealId == state.selectedDeal?.dealId,
            )).toList(),
            const NewDealTile()
          ],
        );
      },
    );
  }
}

class DealHeaderTile extends StatelessWidget {
  final DealsEntity deal;
  final bool selected;
  const DealHeaderTile({Key? key, required this.deal, this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<CreateEditDealsBloc>(context).add(
          SelectDealEntityEvent(deal),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color:
          selected ? AppColor.primary.withOpacity(0.2) : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(deal.description ?? ""),
                Text(deal.dealId),
              ],
            ),
            // CloudSyncIcon(
            //   syncState: taxGroup.syncState ?? 0,
            // )
          ],
        ),
      ),
    );
  }
}

class NewDealTile extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  const NewDealTile(
      {Key? key,
        this.padding = const EdgeInsets.all(16)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<CreateEditDealsBloc>(context).add(
          CreateNewDealEntityEvent(),
        );
      },
      child: Container(
        padding: padding,
        child: Row(
          children: const [
            Icon(Icons.add),
            SizedBox(width: 16),
            Text("Create New Deal"),
          ],
        ),
      ),
    );
  }
}