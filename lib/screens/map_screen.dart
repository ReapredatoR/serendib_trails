import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(6.8090, 80.4993),
              zoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [
                      LatLng(6.8090,
                          80.4993), // Replace with actual trail coordinates
                      LatLng(6.8100,
                          80.5000), // Replace with actual trail coordinates
                    ],
                    strokeWidth: 4.0,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 4,
                  color: Colors.green, // Add green accent color
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Adam\'s Peak', // Replace with dynamic data
                      style: TextStyle(
                        fontSize: 18, // Increase font size,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16), // Add spacing between tiles
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '3 km left', // Replace with dynamic data
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '4h 30m left', // Replace with dynamic data
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: MediaQuery.of(context).size.width / 2 - 75,
            child: FloatingActionButton.extended(
              onPressed: () {
                // Handle tracking start
              },
              label: Text('Start Tracking'),
              icon: Icon(Icons.play_arrow),
            ),
          ),
          Positioned(
            bottom: 100,
            left: MediaQuery.of(context).size.width / 2 - 100,
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                // Handle emergency action
              },
              backgroundColor: Colors.red,
              child: Icon(Icons.warning),
            ),
          ),
          Positioned(
            bottom: 100,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                // Handle location pin action
              },
              child: Icon(Icons.location_pin),
            ),
          ),
          Positioned(
            bottom: 100,
            right: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                // Handle map action
              },
              child: Icon(Icons.map),
            ),
          ),
          Positioned(
            bottom: 100,
            right: MediaQuery.of(context).size.width / 2 - 100,
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                // Handle another action
              },
              child: Icon(Icons.help),
            ),
          ),
        ],
      ),
    );
  }
}
