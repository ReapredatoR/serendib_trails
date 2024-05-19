import 'package:flutter/material.dart';

class TrailListScreen extends StatelessWidget {
  final List<String> trails = [
    "Adam's Peak (Sri Pada)",
    "Ella Rock",
    "Little Adam's Peak",
    "Knuckles Mountain Range",
    "Horton Plains National Park",
    "Sinharaja Rainforest",
    "Pidurangala Rock"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trails.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(trails[index]),
          onTap: () {
            // Navigate to trail details screen
          },
        );
      },
    );
  }
}
