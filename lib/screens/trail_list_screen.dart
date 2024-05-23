import 'package:flutter/material.dart';

class Trail {
  final String name;
  final double miles;
  final double time; // Time in hours
  final double stars; // Rating out of 5

  Trail(
      {required this.name,
      required this.miles,
      required this.time,
      required this.stars});
}

class TrailListScreen extends StatelessWidget {
  final List<Trail> trails = [
    Trail(name: "Adam's Peak (Sri Pada)", miles: 5.5, time: 3.0, stars: 4.8),
    Trail(name: "Ella Rock", miles: 3.1, time: 2.5, stars: 4.5),
    Trail(name: "Little Adam's Peak", miles: 1.8, time: 1.0, stars: 4.2),
    Trail(name: "Knuckles Mountain Range", miles: 7.3, time: 4.0, stars: 4.7),
    Trail(
        name: "Horton Plains National Park", miles: 6.2, time: 3.5, stars: 4.9),
    Trail(name: "Sinharaja Rainforest", miles: 4.6, time: 2.8, stars: 4.6),
    Trail(name: "Pidurangala Rock", miles: 2.2, time: 1.5, stars: 4.3)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trail List'),
      ),
      body: ListView.builder(
        itemCount: trails.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(trails[index].name),
            subtitle: Row(
              children: [
                Icon(Icons.star, size: 16.0, color: Colors.amber),
                SizedBox(width: 4.0),
                Text('${trails[index].stars}'),
                SizedBox(width: 16.0),
                Icon(Icons.directions_walk, size: 16.0, color: Colors.blue),
                SizedBox(width: 4.0),
                Text('${trails[index].miles} miles'),
                SizedBox(width: 16.0),
                Icon(Icons.timer, size: 16.0, color: Colors.green),
                SizedBox(width: 4.0),
                Text('${trails[index].time} hours'),
              ],
            ),
            onTap: () {
              // Navigate to trail details screen
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TrailListScreen(),
  ));
}
