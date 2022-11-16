import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = 50.00;

    var path = Path();
    path.moveTo(0, height);

    path.lineTo(0, size.height - height * 2);

    var x1 = Offset(0, size.height - height);
    var y1 = Offset(height, size.height - height);
    path.quadraticBezierTo(x1.dx, x1.dy, y1.dx, y1.dy);

    path.lineTo((size.width / 2) - height, size.height - height);

    path.lineTo((size.width / 2) - height, size.height - height);

    var a = Offset((size.width / 2) - (height / 2), size.height - height);
    var b = Offset((size.width / 2) - (height / 2), size.height - (height / 2));
    path.quadraticBezierTo(a.dx, a.dy, b.dx, b.dy);

    var c = Offset((size.width / 2) - (height / 2), size.height);
    var d = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(c.dx, c.dy, d.dx, d.dy);

    var e = Offset((size.width / 2) + (height / 2), size.height);
    var f = Offset((size.width / 2) + (height / 2), size.height - (height / 2));
    path.quadraticBezierTo(e.dx, e.dy, f.dx, f.dy);

    var g = Offset((size.width / 2) + (height / 2), size.height - height);
    var h = Offset((size.width / 2) + (height), size.height - height);
    path.quadraticBezierTo(g.dx, g.dy, h.dx, h.dy);
    path.lineTo(size.width - height, size.height - height);
    path.lineTo(size.width - height, size.height - height);

    var x2 = Offset(size.width, size.height - height);
    var y2 = Offset(size.width, size.height - height * 2);
    path.quadraticBezierTo(x2.dx, x2.dy, y2.dx, y2.dy);

    path.lineTo(size.width, height);

    var x3 = Offset(size.width, 0);
    var y3 = Offset(size.width - height, 0);
    path.quadraticBezierTo(x3.dx, x3.dy, y3.dx, y3.dy);

    path.lineTo(height, 0);

    var x4 = const Offset(0, 0);
    var y4 = Offset(0, height);
    path.quadraticBezierTo(x4.dx, x4.dy, y4.dx, y4.dy);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}