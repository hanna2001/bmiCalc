import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input_page.dart';

void main() {
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // floatingActionButtonTheme: FloatingActionButtonThemeData(
        //   backgroundColor: k_RoundButClr,
        // ),
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        // ignore: deprecated_member_use
        textTheme: TextTheme(body1: TextStyle(color: Colors.pink)),
      ),
      home: InputPage(),
    );
  }
}
