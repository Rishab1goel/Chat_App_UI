import 'package:flutter/material.dart';
import 'homescreen.dart';

void main(){

  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CHAT APP',
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.yellowAccent,
      ),

      home: HomeScreen(),
    );
  }
}
