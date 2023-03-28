import 'package:flutter/material.dart';
import 'package:googlemaps/Login.dart';
import 'package:googlemaps/map.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyLogin(),
    );
  }
}

