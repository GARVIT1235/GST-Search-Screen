import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SearchPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return MaterialApp(
        title: 'GST Search',
        themeMode: ThemeMode.light,
        theme: ThemeData(
          brightness: Brightness.light,
            primarySwatch: Colors.green,
            ),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => SearchPage(),
        }
    );
  }
}