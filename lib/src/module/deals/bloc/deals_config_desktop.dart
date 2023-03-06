import 'package:flutter/material.dart';

import '../../rule_builder/rule_builder_view.dart';

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
                child: Card(
                  elevation: 0,
                  child: Container(),
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
