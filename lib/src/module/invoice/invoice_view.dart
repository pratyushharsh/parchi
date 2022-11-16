import 'package:flutter/material.dart';

class InvoiceView extends StatelessWidget {
  const InvoiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${mediaQuery.size.width * mediaQuery.devicePixelRatio}'),
          Text('${mediaQuery.size.width}'),
          Text('${mediaQuery.devicePixelRatio}'),
          Text('${mediaQuery.devicePixelRatio * 150}'),
          Text('${mediaQuery.devicePixelRatio * 160}'),
        ],
      )),
    );
  }
}
