import 'package:flutter/material.dart';
import 'package:foody/pages/intro/intro.page.dart';
import 'package:foody/services/navigator.service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPage((subcont){
        //clicked
        print("Login CLick");
        NavigatorService.instance.toLoginPage(subcont);
      }),
    );
  }
}