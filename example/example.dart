// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:control_button/control_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control Button Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control Button'),
      ),
      body: Center(
        child: ControlButton(
          sectionOffset: 45,
          externalDiameter: 300,
          internalDiameter: 120,
          mainAction: () => print('Selected Center'),
          sections: [
            () => print('Selected 1'),
            () => print('Selected 2'),
            () => print('Selected 3'),
            () => print('Selected 4'),
          ],
        ),
      ),
    );
  }
}
