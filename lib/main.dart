import 'package:covid_19/screeens/home_screen.dart';
import 'package:covid_19/utilities.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19',
      theme: ThemeData(primaryColor: Utilities.primaryColor),
      home: HomeScreen(),
    );

  }

}
