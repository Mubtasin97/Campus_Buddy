import 'package:campus_buddy/repository/screens/MetarialPage/metarial.dart';
import 'package:campus_buddy/repository/screens/HomeScreen/homeScreen.dart';
import 'package:campus_buddy/repository/screens/login/loginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Campus buddy",
      //home:  HomePage(),
      home: HomePage(),
    );
  }
}
