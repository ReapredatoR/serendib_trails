import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(SerendibTrailsApp());
}

class SerendibTrailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serendib Trails',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
