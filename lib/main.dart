import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Screens/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     builder: (context, widget) => ResponsiveWrapper.builder(
       widget,
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint(breakpoint: 450, name: MOBILE),
            ResponsiveBreakpoint(breakpoint: 800, name: TABLET, autoScale: true),
            ResponsiveBreakpoint(breakpoint: 1000, name: TABLET, autoScale: true),
            ResponsiveBreakpoint(breakpoint: 1200, name: DESKTOP),
            ResponsiveBreakpoint(breakpoint: 2460, name: "4K", autoScale: true),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
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
