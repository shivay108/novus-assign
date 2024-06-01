import 'package:flutter/material.dart';
import '../models/rocket.dart';

class RocketCard extends StatelessWidget {
  final Rocket rocket;

  RocketCard({required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Image.network(rocket.flickrImage),
          ListTile(
            title: Text(rocket.name),
            subtitle: Text('Country: ${rocket.country}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Engines Count: ${rocket.enginesCount}'),
          ),
        ],
      ),
    );
  }
}
