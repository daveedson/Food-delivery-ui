import 'package:flutter/material.dart';

import 'Screens/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Food Delivery',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.lightBlue,
    ) ,
    home: HomeScreen(),
    );
  }
}
