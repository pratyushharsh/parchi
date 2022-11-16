import 'package:flutter/material.dart';

import 'custom_button.dart';

Future<T?> yesOrCancelDialog<T>(BuildContext context, String title,
    {String? content, String? yesText, String? cancelText}) {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content ?? ''),
        actions: [
          SizedBox(
            width: 100,
            child: RejectButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              label: 'Cancel',
            ),
          ),
          SizedBox(
            width: 100,
            child: AcceptButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              label: 'OK',
            ),
          ),
        ],
      );
    },
  );
}