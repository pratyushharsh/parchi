import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

Future<T?> yesOrCancelDialog<T>(BuildContext context, String title,
    {String? content, String? yesText, String? cancelText}) {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title).tr(),
        content: Text(content ?? '').tr(),
        actions: [
          SizedBox(
            width: 100,
            child: RejectButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              label: (cancelText ?? '_cancel').tr(),
            ),
          ),
          SizedBox(
            width: 100,
            child: AcceptButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              label: (yesText ?? '_ok').tr(),
            ),
          ),
        ],
      );
    },
  );
}