import 'package:flutter/material.dart';
import 'main_page.dart'; // Import your main page file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serendib Trails', // Title of your app
      theme: ThemeData(
        primarySwatch: Colors.green, // Example theme color
      ),
      home: MainPage(), // Set the MainPage as the initial screen
    );
  }
}
