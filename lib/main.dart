import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DetailPage.dart';
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
            primarySwatch: Colors.green,
            textTheme: TextTheme(
                bodyText2: GoogleFonts.quicksand(fontSize: 14.0))
        ),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            textTheme: TextTheme(bodyText2: GoogleFonts.bitter(fontSize: 14.0))
        ),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => SearchPage(),
          '/home': (BuildContext context) => DetailPage(),
        }
    );
  }
}