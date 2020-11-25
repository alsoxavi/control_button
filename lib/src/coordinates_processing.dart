// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math';
import 'package:flutter/foundation.dart';

class Coordinates {
  final double posx;
  final double posy;

  Coordinates({
    @required this.posx,
    @required this.posy,
  });
}

class CoordinatesProcessing {
  double _numberMap({
    @required double input,
    @required double inputMin,
    @required double inputMax,
    @required double outputMin,
    @required double outputMax,
  }) {
    return ((input - inputMin) *
            (outputMax - outputMin) /
            (inputMax - inputMin)) +
        outputMin;
  }

  double getAngle(Coordinates coordinates) {
    double position;
    double x = _numberMap(
      input: coordinates.posx,
      inputMax: 300,
      inputMin: 0,
      outputMin: -1,
      outputMax: 1,
    );
    double y = _numberMap(
      input: coordinates.posy,
      inputMax: 0,
      inputMin: 300,
      outputMin: -1,
      outputMax: 1,
    );
    // Throw error if coordinates are (0,0).
    if (x == 0 && y == 0) throw Error();

    // Get angle according to coordinates
    if (x == 0.0 || y == 0.0) {
      (x > 0 && x != 0) ? position = 0 : position = 180;
      (y > 0 && y != 0) ? position = 90 : position = 270;
    } else {
      if (y > 0) {
        position = atan2(y, x) * 180 / pi;
      } else {
        position = 360 + atan2(y, x) * 180 / pi;
      }
    }
    return position;
  }
}
