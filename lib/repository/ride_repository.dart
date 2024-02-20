// ignore_for_file: deprecated_member_use, avoid_print

import 'package:ride_checker_test_task/model/ride_model.dart';
import 'package:ride_checker_test_task/repository/dio_config.dart';
import 'package:url_launcher/url_launcher.dart';

class RideRepository {
  late IApi client;
  RideRepository({required this.client});

  Future<List<RideModel>> getRides({
    required String fromWhere,
    required String toWhere,
    required String date,
  }) async {
    List<RideModel> foundRides = [];
    try {
      var url = "/api/avibus/search_trips_cities/";
      var queryParams = {
        "departure_city": fromWhere,
        "destination_city": toWhere,
        "date": date,
      };
      var response = await client.get(url, queryParams);

      var trips = response.data['trips'] as List<dynamic>;
      foundRides = trips.map((trip) => RideModel.fromJson(trip)).toList();
      return foundRides;
    } catch (e) {
      print(e.toString());
      return foundRides;
    }
  }

  void openURL() async {
    var url = "https://github.com/eaaniwezi";
    try {
      await canLaunch(url);
      await launch(url);
    } catch (e) {
      print(e);
      'Could not launch $url';
    }
  }
}
