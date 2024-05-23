import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _posts = [
    {
      'image': 'lib/images/1.jpg',
      'title': 'Amazing views from Chariot Path!',
      'likes': 120,
      'comments': 45,
    },
    {
      'image': 'lib/images/QVZkVjV3b1FkWFNpU09WRg.jpeg',
      'title': 'Exploring the Dolukanda (දොලුකන්ද)',
      'likes': 80,
      'comments': 30,
    },
    {
      'image': 'lib/images/QVZkVjV3b1FkWFNpU09WRg.jpeg',
      'title': 'Exploring the Knuckles Mountain Range',
      'likes': 200,
      'comments': 70,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildPost(Map<String, dynamic> post) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            post['image'],
            fit: BoxFit.cover,
            height: 200, // Fixed height for all images
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post['title'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
              ),
              Text('${post['likes']} likes'),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {},
              ),
              Text('${post['comments']} comments'),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Community'),
          bottom: TabBar(
            onTap: _onItemTapped,
            tabs: <Widget>[
              Tab(text: 'Posts'),
              Tab(text: 'Chat with Hikers'),
              Tab(text: 'Make a Difference'),
            ],
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return _buildPost(_posts[index]);
              },
            ),
            Center(child: Text('Chat with other hikers - Coming Soon')),
            Center(child: Text('Think and Make a Difference - Coming Soon')),
          ],
        ),
      ),
    );
  }
}
