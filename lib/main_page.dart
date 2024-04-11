import 'package:flutter/material.dart';

// Import additional pages as needed
import 'package:your_project_name/hike_list_page.dart';
import 'package:your_project_name/community_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedCategoryIndex = 0; // Assuming initial selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Serendib Trails")),
      body: Column(
        children: [
          // Category Selection
          DropdownButton<String>(
            value: [
              'Beginner',
              'Moderate',
              'Challenging'
            ][_selectedCategoryIndex], // Display selected item
            items: ['Beginner', 'Moderate', 'Challenging']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                // Update _selectedCategoryIndex on change
                _selectedCategoryIndex =
                    ['Beginner', 'Moderate', 'Challenging'].indexOf(newValue!);
              });
            },
          ),

          // Action Buttons
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Adjust for desired layout
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HikeListPage()),
                    );
                  },
                  child: Text("Find a Hike"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommunityPage()),
                    );
                  },
                  child: Text("Community"),
                ),
                // Add more buttons as needed...
              ],
            ),
          )
        ],
      ),
    );
  }
}
