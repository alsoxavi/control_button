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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';

  void updateState(String showText) {
    setState(() {
      text = showText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ControlButton(
              sectionOffset: FixedAngles.Zero,
              externalDiameter: 300,
              internalDiameter: 120,
              dividerColor: Colors.blue,
              elevation: 2,
              externalColor: Colors.lightBlue[100],
              internalColor: Colors.grey[300],
              mainAction: () => updateState('Selected Center'),
              sections: [
                () => updateState('Selected 1'),
                () => updateState('Selected 2'),
                () => updateState('Selected 3'),
                () => updateState('Selected 4'),
              ],
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
