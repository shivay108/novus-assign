import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/rocket.dart';

class ApiService {
  final String baseUrl = 'https://api.spacexdata.com/v4/rockets';

  Future<List<Rocket>> fetchRockets() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((rocket) => Rocket.fromJson(rocket)).toList();
    } else {
      throw Exception('Failed to load rockets');
    }
  }
}
