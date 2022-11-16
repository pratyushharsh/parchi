import 'package:flutter/material.dart';

import 'create_edit_tax.dart';

class TaxConfigDesktopView extends StatelessWidget {
  const TaxConfigDesktopView({Key? key}) : super(key: key);

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
                "Tax Group",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Tax Rule",
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
                  child: TaxGroupList(),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Card(
                  elevation: 0,
                  child: TaxRuleList(),
                ),
              ),
            )
          ]),
        ),
      ],
    );
  }
}
