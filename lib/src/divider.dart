// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'angles.dart';

/// PainterClass class that extends from CustomPainter provides the divisions for the ControlButton.
class PainterClass extends CustomPainter {
  final int sections;
  final FixedAngles angle;
  final Color dividerColor;
  final double dividerThickness;

  /// PainterClass constructor.
  /// You can modify the sections in the ControlButton instance, this will follow along.
  PainterClass({
    this.sections = 2,
    this.dividerThickness = 1.0,
    this.angle = FixedAngles.Zero,
    this.dividerColor = const Color(0x3377E7E7E),
  });

  /// Override method on paint to draw in the canvas.
  @override
  void paint(Canvas canvas, Size size) {
    final pinkPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = dividerThickness
      ..color = dividerColor;

    _drawSections(
      canvas,
      sections,
      size,
      pinkPaint,
      Angles().fixedToRadian(angle),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  /// This functions draws the dividers only horizontally and rotates a defined angle while doing it.
  void _drawSections(
      Canvas canvas, int sections, Size size, Paint paint, double angleOffset) {
    double angle = 6.28319 / sections;

    canvas.save();

    if (angleOffset != 0.0) {
      canvas.translate(size.width / 2, size.height / 2);
      canvas.rotate(0.785398);
      canvas.translate(-size.width / 2, -size.height / 2);
    }

    for (int i = 0; i < sections; i++) {
      canvas.translate(size.width / 2, size.height / 2);
      canvas.rotate(angle);
      canvas.translate(-size.width / 2, -size.height / 2);
      canvas.drawLine(
          Offset(0, size.width / 2), Offset(size.width, size.width / 2), paint);
    }

    canvas.restore();
  }
}
