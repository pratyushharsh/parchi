import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {

  late DateTime _startTime;
  final DateFormat _format = DateFormat.Hms();
  late Timer _timer;

  @override
  initState() {
    super.initState();
    _startTime = DateTime.now();
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      _updateTime();
    });
  }

  _updateTime() {
    setState(() {
      _startTime = DateTime.now();
    });
  }

  @override
  dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text(_format.format(_startTime), style: const TextStyle(color: Colors.white)),
    );
  }
}
