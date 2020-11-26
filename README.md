# control_button

Control button with adjustable sections

## About this package

This widget will allow you to create templates for different kind of controllers.

### Variables

|   Variable  |   Type   |   Required  |
| :---------: | :------: | :---------: |
| `externalDiameter` | _double_ | yes |
| `internalDiameter` | _double_ | yes |
| `mainAction` | _Function_ | yes |
| `sections` | _List<Function>_ | yes |
| `elevation` | _double_ | optional |
| `dividerThickness` | _double_ | optional |
| `externalColor` | _Color_ | optional |
| `internalColor` | _Color_ | optional |
| `dividerColor` | _Color_ | optional |
| `shadowDirection` | _Offset_ | optional |
| `sectionOffset` | _FixedAngles_ | optional |

## Images

| Basic | More Sections | Customizable |
| :---: | :-----------: | :----------: |
| <img src="https://flutter.version-one.com/packages/control_button/basic.gif"/> | <img src="https://flutter.version-one.com/packages/control_button/more_buttons.gif"/> | <img src="https://flutter.version-one.com/packages/control_button/custom.gif"/> |

## Usage

To use this plugin, add `control_button` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/)

``` dart
dependencies:
  control_button: ^0.0.2
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
)
```