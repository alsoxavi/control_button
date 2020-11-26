// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math';

/// FixedAngles enum that includes common angles for the ControlButton.
enum FixedAngles {
  Zero,
  Rectangular,
  Inclined45,
  Inclined120,
  Plane,
}

/// Angles class provides helpers to convert FixedAngles to degrees or radians.
class Angles {
  final Map<num, double> _angleMap = const {
    0: 0.0,
    1: 1.5708,
    2: 0.785398,
    3: 2.0944,
    4: 3.14159,
  };

  /// fixedToRadian converts an object of class FixedAngles to radians
  double fixedToRadian(FixedAngles angle) {
    return _angleMap[angle.index];
  }

  /// fixedToDegrees converts an object of class FixedAngles to degrees
  double fixedToDegrees(FixedAngles angle) {
    return _angleMap[angle.index] * 180 / pi;
  }
}
