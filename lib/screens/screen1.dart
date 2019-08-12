import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Screen1 extends StatefulWidget {
  double _currentValue = 0.0;
  bool _currentSwitchValue = true;
  String _currentTextValue = "";

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlatformSlider(
            min: 0.0,
            max: 100.0,
            value: widget._currentValue,
            onChanged: (value) {
              setState(() {
                widget._currentValue = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlatformSwitch(
            value: widget._currentSwitchValue,
            onChanged: (value) {
              setState(() {
                widget._currentSwitchValue = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlatformTextField(
            keyboardType: TextInputType.text,
            onChanged: (String value) {
              setState(() {
                widget._currentTextValue = value;
              });
            },
            android: (_) => MaterialTextFieldData(
              decoration: InputDecoration(labelText: 'Text Field'),
            ),
            ios: (_) => CupertinoTextFieldData(
              placeholder: 'Text Field',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlatformButton(
            onPressed: () {

            },
            child: Text('Button'),
            android: (_) => MaterialRaisedButtonData(

            ),
            ios: (_) => CupertinoButtonData(
            ),
          ),
        ),
      ],
    );
  }
}
