import 'package:flutter/material.dart';
import '../models/rocket.dart';
import '../services/api_service.dart';
import '../widgets/rocket_card.dart';

class RocketsScreen extends StatefulWidget {
  @override
  _RocketsScreenState createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> {
  late Future<List<Rocket>> futureRockets;

  @override
  void initState() {
    super.initState();
    futureRockets = ApiService().fetchRockets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX Rockets'),
      ),
      body: FutureBuilder<List<Rocket>>(
        future: futureRockets,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return RocketCard(rocket: snapshot.data![index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load rockets'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
