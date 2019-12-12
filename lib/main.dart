import 'package:flutter/material.dart';
import 'package:portfolio/modules/routeGenerator.dart';
import 'package:portfolio/pages/homeApp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static Color _mainColor = Color.fromRGBO(100, 255, 218, 1);

  static TextTheme _textTheme = TextTheme(
    title: TextStyle(
      fontFamily: 'BlackChancery',
      fontSize: 40,
      color: _mainColor,
    ),
    body1: TextStyle(
      color: _mainColor,
    ),
  );

  static IconThemeData _iconThemeData = IconThemeData(
    color: _mainColor,
  );

  static AppBarTheme _appBarTheme = AppBarTheme(
    iconTheme: _iconThemeData,
    color: Colors.transparent,
    textTheme: _textTheme,
  );

  static ButtonThemeData _buttonThemeData = ButtonThemeData(
    buttonColor: _mainColor,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: _appBarTheme,
        iconTheme: _iconThemeData,
        textTheme: _textTheme,
        buttonTheme: _buttonThemeData,
      ),
      home: PortfolioApp(
        title: 'Portfolio',
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
