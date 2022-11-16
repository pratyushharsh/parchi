/*
 * Copyright (c) 2021
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */


import 'package:flutter/material.dart';

import 'get_position.dart';

class KeypadWidget extends StatefulWidget {
  final GetPosition? position;
  final bool showArrow;
  final Offset offset;
  final Rect parentPosition;
  final EdgeInsets? contentPadding;
  final Widget child;

  const KeypadWidget(
      {Key? key,
      this.position,
      required this.showArrow,
      this.contentPadding,
      required this.offset,
      required this.child,
      required this.parentPosition})
      : super(key: key);

  @override
  State<KeypadWidget> createState() => _KeypadWidgetState();
}

class _KeypadWidgetState extends State<KeypadWidget> {
  Offset? position;

  bool isCloseToTopOrBottom(Offset position) {
    var height = 120.0;
    height = MediaQuery.of(context).size.height;
    final bottomPosition =
        position.dy + ((widget.position?.getHeight() ?? 0) / 2);
    final topPosition = position.dy - ((widget.position?.getHeight() ?? 0) / 2);
    return (MediaQuery.of(context).size.height - bottomPosition) <= height &&
        topPosition >= height;
  }

  String findPositionForContent(Offset position) {
    if (isCloseToTopOrBottom(position)) {
      return 'ABOVE';
    } else {
      return 'BELOW';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: widget.parentPosition.right,
        top: widget.parentPosition.bottom,
        child: widget.child);
  }
}

// class _Arrow extends CustomPainter {
//   final Color strokeColor;
//   final PaintingStyle paintingStyle;
//   final double strokeWidth;
//   final bool isUpArrow;
//
//   _Arrow(
//       {this.strokeColor = Colors.black,
//       this.strokeWidth = 3,
//       this.paintingStyle = PaintingStyle.stroke,
//       this.isUpArrow = true});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = strokeColor
//       ..strokeWidth = strokeWidth
//       ..style = paintingStyle;
//
//     canvas.drawPath(getTrianglePath(size.width, size.height), paint);
//   }
//
//   Path getTrianglePath(double x, double y) {
//     if (isUpArrow) {
//       return Path()
//         ..moveTo(0, y)
//         ..lineTo(x / 2, 0)
//         ..lineTo(x, y)
//         ..lineTo(0, y);
//     } else {
//       return Path()
//         ..moveTo(0, 0)
//         ..lineTo(x, 0)
//         ..lineTo(x / 2, y)
//         ..lineTo(0, 0);
//     }
//   }
//
//   @override
//   bool shouldRepaint(_Arrow oldDelegate) {
//     return oldDelegate.strokeColor != strokeColor ||
//         oldDelegate.paintingStyle != paintingStyle ||
//         oldDelegate.strokeWidth != strokeWidth;
//   }
// }
