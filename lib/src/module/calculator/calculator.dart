import 'package:flutter/material.dart';

class Keypad extends StatefulWidget {
  final TextEditingController? controller;
  const Keypad({Key? key, this.controller}) : super(key: key);

  @override
  State<Keypad> createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> {
  late TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      controller = TextEditingController();
    } else {
      controller = widget.controller;
    }
  }

  void onClick(String val) {
    String tmp = controller!.text;

    if (val == "<" && tmp.isNotEmpty) {
      tmp = tmp.substring(0, tmp.length - 1);
    } else if (val != "<") {
      tmp = tmp + val;
    }

    controller!.value = TextEditingValue(
        text: tmp,
        selection: TextSelection.collapsed(offset: tmp.length)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _CalenderCard(
              text: "7",
              onClick: () {
                onClick("7");
              },
            ),
            _CalenderCard(
              text: "8",
              onClick: () {
                onClick("8");
              },
            ),
            _CalenderCard(
              text: "9",
              onClick: () {
                onClick("9");
              },
            )
          ],
        ),
        Row(
          children: [
            _CalenderCard(
              text: "4",
              onClick: () {
                onClick("4");
              },
            ),
            _CalenderCard(
              text: "5",
              onClick: () {
                onClick("5");
              },
            ),
            _CalenderCard(
              text: "6",
              onClick: () {
                onClick("6");
              },
            )
          ],
        ),
        Row(
          children: [
            _CalenderCard(
              text: "1",
              onClick: () {
                onClick("1");
              },
            ),
            _CalenderCard(
              text: "2",
              onClick: () {
                onClick("2");
              },
            ),
            _CalenderCard(
              text: "3",
              onClick: () {
                onClick("3");
              },
            )
          ],
        ),
        Row(
          children: [
            _CalenderCard(
              text: "+/-",
              onClick: () {
                onClick("<");
              },
            ),
            _CalenderCard(
              text: "0",
              onClick: () {
                onClick("0");
              },
            ),
            _CalenderCard(
              text: "<",
              onClick: () {
                onClick("<");
              },
            )
          ],
        ),
      ],
    );
  }
}

class _CalenderCard extends StatelessWidget {
  final String text;
  final Function()? onClick;
  const _CalenderCard({Key? key, required this.text, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: InkWell(
        onTap: onClick,
        child: SizedBox(
          height: 80,
          width: 80,
          child: Center(child: Text(text, style: const TextStyle(fontSize: 24),)),
        ),
      ),
    );
  }
}
