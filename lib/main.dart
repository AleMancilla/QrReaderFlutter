import 'package:flutter/material.dart';
import 'package:qreader/src/pages/HomePage.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QrRoute',
      initialRoute: "/home",
      routes: {
        "/home": (BuildContext context) => HomePage(),
      },
    );
  }
}