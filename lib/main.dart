import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:platform_app/screens/screen1.dart';
import 'package:platform_app/screens/screen2.dart';
import 'package:platform_app/screens/screen3.dart';
import 'package:platform_app/screens/screen4.dart';

void main() => runApp(MyApp());

// Themes
final materialThemeData = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    accentColor: Colors.blue,
    appBarTheme: AppBarTheme(color: Colors.blue.shade600),
    primaryColor: Colors.blue,
    secondaryHeaderColor: Colors.blue,
    canvasColor: Colors.blue,
    backgroundColor: Colors.red,
    textTheme: TextTheme().copyWith(body1: TextTheme().body1));
final cupertinoTheme = CupertinoThemeData(
    primaryColor: Colors.blue,
    barBackgroundColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white);

// Styles
final bottomNavTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
final toolbarButtonTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
final toolbarTextStyle = TextStyle(color: Colors.white, fontSize: 16.0);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
        debugShowCheckedModeBanner: false,
        android: (_) => MaterialAppData(theme: materialThemeData),
        ios: (_) => CupertinoAppData(theme: cupertinoTheme),
        home: MyHomePage(title: 'Flutter Platform Aware Widgets'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _TabIndex = 0;

  @override
  Widget build(BuildContext context) {

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(widget.title, style: toolbarTextStyle,),
        ios: (_) => CupertinoNavigationBarData(
          transitionBetweenRoutes: false,
          trailing: PlatformButton(
            padding: EdgeInsets.all(4.0),
            child: Icon(Icons.add, color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                platformPageRoute(builder: (BuildContext context) {
                  return Screen4();
                }),
              );
            },
          ),
        ),
      ),
      body: getPage(_TabIndex),
      bottomNavBar: PlatformNavBar(
        currentIndex: _TabIndex,
        itemChanged: (index) {
          setState(() {
            _TabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.business, color: Colors.grey),
            title: new Text('Screen 1', style: bottomNavTextStyle),
            activeIcon: new Icon(Icons.business, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person, color: Colors.grey),
            title: new Text('Screen 2', style: bottomNavTextStyle),
            activeIcon: new Icon(Icons.person, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note, color: Colors.grey),
            title: Text(
              'Screen 3',
              style: bottomNavTextStyle,
            ),
            activeIcon: new Icon(Icons.note, color: Colors.white),
          )
        ],
      ),
      android: (_) => MaterialScaffoldData(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              platformPageRoute(builder: (BuildContext context) {
                return Screen4();
              }),
            );

          },
          tooltip: 'Screen 4',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget getPage(int tabIndex) {
    switch (tabIndex) {
      case 1:
        return Screen2();
      case 2:
        return Screen3();
      default:
        return Screen1();
    }
  }
}
