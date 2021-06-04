import 'package:employebloc/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Employee App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.dark
      ),
    debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
