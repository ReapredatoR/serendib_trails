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
      'image': 'lib/images/2.jpeg',
      'title': 'Exploring the Dolukanda (දොලුකන්ද)',
      'likes': 80,
      'comments': 30,
    },
    {
      'image': 'lib/images/3.jpg',
      'title': 'Sunrise from the top of the Great Western!',
      'likes': 200,
      'comments': 70,
    },
  ];

  final List<Map<String, dynamic>> _chats = [
    {
      'profilePic': 'lib/images/profile1.jpg',
      'name': 'Kanishka',
      'message': 'Are we meeting at the trailhead?',
      'unreadMessages': 0,
      'lastSeen': '2 hours ago'
    },
    {
      'profilePic': 'lib/images/profile2.jpg',
      'name': 'Ravindu',
      'message': 'I saw an amazing waterfall!',
      'unreadMessages': 3,
      'lastSeen': 'just now'
    },
    {
      'profilePic': 'lib/images/profile3.jpg',
      'name': 'Nadeeja',
      'message': 'When is our next hike?',
      'unreadMessages': 1,
      'lastSeen': '1 hour ago'
    },
    {
      'profilePic': 'lib/images/profile4.jpg',
      'name': 'Kaweesha',
      'message': 'Check out these photos!',
      'unreadMessages': 0,
      'lastSeen': '30 mins ago'
    },
    {
      'profilePic': 'lib/images/profile5.jpg',
      'name': 'Sevinik',
      'message': 'The trail was tough but worth it!',
      'unreadMessages': 5,
      'lastSeen': '10 mins ago'
    },
    {
      'profilePic': 'lib/images/profile6.jpg',
      'name': 'Bakka Aiya',
      'message': 'Up for a night hike?',
      'unreadMessages': 4,
      'lastSeen': 'yesterday'
    },
    {
      'profilePic': 'lib/images/profile7.jpg',
      'name': 'Mayantha',
      'message': 'The weather was perfect today!',
      'unreadMessages': 0,
      'lastSeen': '5 hours ago'
    },
    {
      'profilePic': 'lib/images/profile8.jpg',
      'name': 'Hasini',
      'message': 'Looking forward to the next adventure!',
      'unreadMessages': 0,
      'lastSeen': 'yesterday'
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
            height: 200,
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
          ),
        ],
      ),
    );
  }

  Widget _buildChat(Map<String, dynamic> chat) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(chat['profilePic']),
      ),
      title: Text(chat['name']),
      subtitle: Text(chat['message']),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (chat['unreadMessages'] > 0)
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.green,
              child: Text(
                chat['unreadMessages'].toString(),
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          if (chat['unreadMessages'] == 0) Text(chat['lastSeen']),
        ],
      ),
      onTap: () {
        // Navigate to chat details screen
      },
    );
  }

  Widget _buildMakeADifferenceSection(
      String title, IconData icon, String content) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(content),
        onTap: () {
          // Handle tap if needed
        },
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
            indicatorColor: Colors.green, // Set indicator color to green
            labelColor: Colors.green, // Set selected tab text color to green
            unselectedLabelColor:
                Colors.black87, // Set unselected tab text color
            onTap: _onItemTapped,
            tabs: <Widget>[
              Tab(text: 'Posts'),
              Tab(text: 'Chats'),
              Tab(text: 'Other'),
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
            ListView.builder(
              itemCount: _chats.length,
              itemBuilder: (context, index) {
                return _buildChat(_chats[index]);
              },
            ),
            ListView(
              children: <Widget>[
                _buildMakeADifferenceSection(
                  'Donate',
                  Icons.volunteer_activism,
                  'Support trail maintenance and preservation efforts by donating.',
                ),
                _buildMakeADifferenceSection(
                  'Help',
                  Icons.help_outline,
                  'Find out how you can volunteer your time to assist on the trails.',
                ),
                _buildMakeADifferenceSection(
                  'Emergency',
                  Icons.warning,
                  'Important emergency contacts and procedures for hikers.',
                ),
                _buildMakeADifferenceSection(
                  'Suggestions',
                  Icons.info_outline,
                  'Share your knowledge and experiences about different trails.',
                ),
                _buildMakeADifferenceSection(
                  'Update Weather Conditions',
                  Icons.cloud,
                  'Provide real-time weather updates to keep hikers informed.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
