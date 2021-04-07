import 'package:flutter/material.dart';
import 'package:mealapp/main.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(
          seconds: 3,
          title: Text("Splash Screen !"),
          navigateAfterSeconds: MyApp(),
        ),
      ),
    );
  }
}
