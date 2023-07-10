import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import '../services/networking.dart';

const apiKey = 'e99dc34eaffb43e91795f4bd97291ceb';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude, longitude;

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();

    double temperature = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];
    String city = weatherData['name'];
    print(temperature);
    print(condition);
    print(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
