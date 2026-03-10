import 'package:flutter/material.dart';

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double startY = size.height * 0.6;
    double curveDepth = size.height * 0.45;

    path.lineTo(0, startY);

    path.quadraticBezierTo(
      size.width / 2,
      startY + curveDepth,
      size.width,
      startY,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}