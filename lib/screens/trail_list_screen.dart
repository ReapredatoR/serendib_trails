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

class TrailListScreen extends StatefulWidget {
  @override
  _TrailListScreenState createState() => _TrailListScreenState();
}

class _TrailListScreenState extends State<TrailListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Trail> _topTrails = [
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
    )
  ];

  final List<Trail> _trendingTrails = [
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
      name: "Ella Rock",
      rating: 4.5,
      length: 4,
      time: "2-3 hours",
      difficulty: "Moderate",
      additionalInfo: "Panoramic views of Ella Gap, tea plantations",
    ),
    Trail(
      name: "Mini World's End",
      rating: 4.3,
      length: 6,
      time: "2-3 hours",
      difficulty: "Moderate",
      additionalInfo: "Similar views to World's End, less crowded",
    )
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trails List'),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.green, // Set indicator color to green
          labelColor: Colors.green, // Set selected tab text color to green
          unselectedLabelColor: Colors.black87, // Set unselected tab text color
          tabs: const [
            Tab(text: 'Top 10 Trails'),
            Tab(text: 'Trending Trails'),
            Tab(text: 'Add Trail'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: _topTrails.length,
            itemBuilder: (context, index) {
              return _buildTrail(_topTrails[index]);
            },
          ),
          ListView.builder(
            itemCount: _trendingTrails.length,
            itemBuilder: (context, index) {
              return _buildTrail(_trendingTrails[index]);
            },
          ),
          ListView(
            children: <Widget>[
              _buildAddTrailSection(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrail(Trail trail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ElevatedButton(
        onPressed: () {
          // Navigate to trail details screen
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
              trail.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4.0),
            Container(
              width: MediaQuery.of(context).size.width - 48,
              child: Text(
                trail.additionalInfo,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.green, // Set text color to green
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.star, size: 16.0, color: Colors.amber),
                SizedBox(width: 4.0),
                Text(
                  '${trail.rating}',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 16.0),
                Icon(Icons.directions_walk, size: 16.0, color: Colors.blue),
                SizedBox(width: 4.0),
                Text(
                  '${trail.length} km',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 16.0),
                Icon(Icons.timer, size: 16.0, color: Colors.green),
                SizedBox(width: 4.0),
                Text(
                  '${trail.time}',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 16.0),
                Icon(Icons.terrain, size: 16.0, color: Colors.brown),
                SizedBox(width: 4.0),
                Text(
                  trail.difficulty,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddTrailSection() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton.icon(
        onPressed: () {
          // Handle adding a new trail
        },
        icon: Icon(Icons.add),
        label: Text("Add a New Trail"),
      ),
    );
  }
}
