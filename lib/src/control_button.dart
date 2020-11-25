// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'coordinates_processing.dart';

/// Control button widget
class ControlButton extends StatelessWidget {
  final double elevation;
  final Color externalColor;
  final Color internalColor;
  final Function mainAction;
  final Offset shadowDirection;
  final double externalDiameter;
  final double internalDiameter;
  final double sectionOffset;
  final List<Function> sections;

  ControlButton({
    this.elevation = 1.5,
    this.sectionOffset = 0,
    this.externalColor = const Color(0xFFF3F3F3),
    this.internalColor = const Color(0xFFF3F3F3),
    this.shadowDirection = const Offset(0.0, 0.0),
    @required this.sections,
    @required this.mainAction,
    @required this.externalDiameter,
    @required this.internalDiameter,
  });

  @override
  Widget build(BuildContext context) {
    final sectionSize = 360 ~/ sections.length;
    return GestureDetector(
      onTapDown: (TapDownDetails tapDetails) {
        double position = CoordinatesProcessing().getAngle(
          new Coordinates(
            posx: tapDetails.localPosition.dx,
            posy: tapDetails.localPosition.dy,
          ),
        );
        sections[position ~/ sectionSize]();
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
    );
  }
}
