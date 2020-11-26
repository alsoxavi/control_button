// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'angles.dart';
import 'divider.dart';
import 'coordinates_processing.dart';

/// Control Button class that extends from StatelessWidget.
class ControlButton extends StatelessWidget {
  final double elevation;
  final Color dividerColor;
  final Color externalColor;
  final Color internalColor;
  final Function mainAction;
  final Offset shadowDirection;
  final double externalDiameter;
  final double dividerThickness;
  final double internalDiameter;
  final List<Function> sections;
  final FixedAngles sectionOffset;

  /// ControlButton constructor.
  /// Required variables: sections<List<Function>>, mainAction<Function>,
  /// externalDiameter<double>, internalDiameter<double>.
  /// ONLY EVEN NUMBER OF SECTIONS IS POSSIBLE.
  ControlButton({
    this.elevation = 1.5,
    this.dividerThickness = 1.0,
    this.sectionOffset = FixedAngles.Zero,
    this.dividerColor = const Color(0x557E7E7E),
    this.externalColor = const Color(0xFFF3F3F3),
    this.internalColor = const Color(0xFFF3F3F3),
    this.shadowDirection = const Offset(0.0, 0.0),
    @required this.sections,
    @required this.mainAction,
    @required this.externalDiameter,
    @required this.internalDiameter,
  });

  /// ControlButton widget
  @override
  Widget build(BuildContext context) {
    final sectionSize = 360 ~/ sections.length;

    return GestureDetector(
      onTapDown: (TapDownDetails tapDetails) {
        double position = Angles().fixedToDegrees(sectionOffset) +
            CoordinatesProcessing().getAngle(
              new Coordinates(
                posx: tapDetails.localPosition.dx,
                posy: tapDetails.localPosition.dy,
              ),
            );
        if (position > 360.0) position -= 360.0;
        position = sections[position ~/ sectionSize]();
      },
      child: Container(
        width: externalDiameter,
        height: externalDiameter,
        decoration: BoxDecoration(
          color: externalColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 1,
              spreadRadius: elevation,
              offset: shadowDirection,
            ),
          ],
        ),
        child: CustomPaint(
          painter: PainterClass(
            angle: sectionOffset,
            sections: sections.length,
            dividerColor: dividerColor,
            dividerThickness: dividerThickness,
          ),
          child: Center(
            child: GestureDetector(
              onTap: mainAction,
              child: Container(
                width: internalDiameter,
                height: internalDiameter,
                decoration: BoxDecoration(
                  color: internalColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 1,
                      spreadRadius: elevation,
                      offset: shadowDirection,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
