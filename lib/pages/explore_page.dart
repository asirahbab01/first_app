import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:first_app/pages/weather_service.dart';
import 'package:first_app/models/weather_model.dart';
import 'package:first_app/pages/yield_forecasting.dart';

import 'forum_page.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String weatherCondition = "Loading...";
  String temperature = "--";
  String location = "Fetching location...";
  String currentTime =
      DateFormat('EEE d MMMM, yyyy\nh:mm a').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    try {
      // Get the user's location
      Position position = await _determinePosition();

      // Fetch weather data using WeatherServices
      WeatherServices weatherService = WeatherServices();
      WeatherData weatherData = await weatherService.fetchCurrentWeather(
          position.latitude, position.longitude);

      // Update the UI with the fetched weather data
      setState(() {
        temperature = "${weatherData.temperature}°C";
        weatherCondition = weatherData.condition;
        location = weatherData.name;
        currentTime =
            DateFormat('EEE d, MMMM yyyy\nh:mm a').format(DateTime.now());
      });
    } catch (e) {
      setState(() {
        weatherCondition = "Error: $e";
      });
    }
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Weather Widget
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
              height: 200,
              child: Card(
                color: Colors.transparent,
                elevation: 0.2,
                shadowColor: Colors.green.shade50,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WeatherHome(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$location $temperature",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              Text(
                                currentTime,
                                style: const TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                weatherCondition,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Add the "Click to show details" text on the right
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "Click to show details",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
              height: 150,
              child: Card(
                color: Colors.greenAccent[400],
                elevation: 2,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForumPage(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.forum, color: Colors.white, size: 40),
                        SizedBox(width: 20),
                        Text(
                          "Join the NGO Forum",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
