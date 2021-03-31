import 'package:flutter/material.dart';

main() {
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            accentColor: Colors.pinkAccent, primaryColor: Colors.green),
        home: Scaffold(
          appBar: AppBar(title: Text("Meal App")),
          body: Container(
          ),
        ));
  }
}