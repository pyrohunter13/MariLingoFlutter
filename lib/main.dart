// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, annotate_overrides, use_key_in_widget_constructors, camel_case_types
//Run this file to execute the code
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wow/MainMenu.dart';
import 'package:flutter_wow/pilgan.dart';
import 'package:flutter_wow/tebakgbr.dart';
import 'package:flutter_wow/terjemhn.dart';
import 'package:flutter_wow/cocokata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => splashScreen(),
        '/main': (context) => MainMenu(),
        '/pilgan': (context) => pilgan(),
        '/tebakgbr': (context) => tebakgbr(),
        '/terjemhn': (context) => MalingTerjemahan(),
        '/cocokata': (context) => MalingCocok(),
      },
    );
  }
}

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/main');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 230,
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/lol.png',
                height: 150,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(padding: EdgeInsets.only(top: 40.0)),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
