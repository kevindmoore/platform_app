import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../main.dart';

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(
          'Screen 4',
          style: toolbarTextStyle,
        ),
        android: (_) => MaterialAppBarData(),
        ios: (_) => CupertinoNavigationBarData(
          transitionBetweenRoutes: false,
          leading: PlatformButton(
            padding: EdgeInsets.all(4.0),
            child: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          width: 300,
          child: Text(
            "Screen 4",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          color: Colors.amber,
        ),
      ),
    );
  }
}
