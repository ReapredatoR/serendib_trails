import 'package:flutter/material.dart';

class Trail {
  final String name;
  final double rating; // Rating out of 5
  final double length; // Length in km
  final String time; // Approximate time
  final String difficulty; // Difficulty level
  final String additionalInfo;

  Trail({
    required this.name,
    required this.rating,
    required this.length,
    required this.time,
    required this.difficulty,
    required this.additionalInfo,
  });
}

class TrailListScreen extends StatelessWidget {
  final List<Trail> trails = [
    Trail(
      name: "Adam's Peak",
      rating: 4.8,
      length: 7,
      time: "5-8 hours",
      difficulty: "Challenging",
      additionalInfo: "Sacred pilgrimage site, stunning sunrise views",
    ),
    Trail(
      name: "Ella Rock",
      rating: 4.5,
      length: 4,
      time: "2-3 hours",
      difficulty: "Moderate",
      additionalInfo: "Panoramic views of Ella Gap, tea plantations",
    ),
    Trail(
      name: "Horton Plains National Park",
      rating: 4.7,
      length: 9.5,
      time: "3-4 hours",
      difficulty: "Moderate",
      additionalInfo: "World's End viewpoint, diverse landscape",
    ),
    Trail(
      name: "Knuckles Mountain Range",
      rating: 4.6,
      length: 60, // Average of the range
      time: "3-5 days",
      difficulty: "Difficult",
      additionalInfo: "Rugged peaks, diverse wildlife, hidden waterfalls",
    ),
    Trail(
      name: "Little Adam's Peak",
      rating: 4.3,
      length: 3,
      time: "1-2 hours",
      difficulty: "Easy",
      additionalInfo: "Similar views to Adam's Peak, less crowded",
    ),
    Trail(
      name: "Pidurangala Rock",
      rating: 4.5,
      length: 2,
      time: "1-2 hours",
      difficulty: "Moderate",
      additionalInfo: "Ancient rock fortress, alternative to Sigiriya",
    ),
    Trail(
      name: "Sinharaja Forest Reserve",
      rating: 4.7,
      length: 15, // Average of the range
      time: "1-3 days",
      difficulty: "Difficult",
      additionalInfo: "UNESCO World Heritage Site, rich biodiversity",
    ),
    Trail(
      name: "Lipton's Seat",
      rating: 4.6,
      length: 7,
      time: "2-3 hours",
      difficulty: "Moderate",
      additionalInfo: "Scenic views of tea plantations",
    ),
    Trail(
      name: "Meemure",
      rating: 4.4,
      length: 14,
      time: "6-7 hours",
      difficulty: "Moderate",
      additionalInfo: "Secluded village, traditional Sri Lankan life",
    ),
    Trail(
      name: "Mini World's End",
      rating: 4.3,
      length: 6,
      time: "2-3 hours",
      difficulty: "Moderate",
      additionalInfo: "Similar views to World's End, less crowded",
    ),
    // Add other top trails here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trails List'),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: trails.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to trail details screen
                // You can implement this navigation here
              },
              style: ElevatedButton.styleFrom(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(16.0),
                backgroundColor: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trails[index].name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Container(
                    width:
                        MediaQuery.of(context).size.width - 48, // Adjust width
                    child: Text(
                      trails[index].additionalInfo,
                      maxLines: 2, // Limit to 2 lines
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16.0, color: Colors.amber),
                      SizedBox(width: 4.0),
                      Text(
                        '${trails[index].rating}',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 16.0),
                      Icon(Icons.directions_walk,
                          size: 16.0, color: Colors.blue),
                      SizedBox(width: 4.0),
                      Text(
                        '${trails[index].length} km',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 16.0),
                      Icon(Icons.timer, size: 16.0, color: Colors.green),
                      SizedBox(width: 4.0),
                      Text(
                        '${trails[index].time}',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 16.0),
                      Icon(Icons.terrain, size: 16.0, color: Colors.brown),
                      SizedBox(width: 4.0),
                      Text(
                        trails[index].difficulty,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
