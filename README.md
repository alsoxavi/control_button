# control_button

Control button with adjustable sections

## About this version

This widget will allow you to create templates for different kind of controllers.

In this version you can adjust:
- Elevation of the buttons.
- Size of the central button.
- Size of the external buttons.
- Color of the central button.
- Color of the external buttons.
- Change the direction of the shadow.
- Functions of the sections and central button.

<img src="https://media.githubusercontent.com/media/alsoxavi/control_button/master/images/example.gif"/>

## Usage
To use this plugin, add `control_button` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/)

``` dart
dependencies:
  control_button: ^0.0.1
```

### Install it 

``` bash
$ flutter pub get
```

### Import it 

``` dart
import 'package:control_button/control_button.dart';
```

## Example

See `example/example.dart`

```dart
ControlButton(
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
)
```