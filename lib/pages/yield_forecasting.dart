import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:first_app/models/weather_model.dart';
import 'package:first_app/pages/weather_service.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  late WeatherData weatherInfo;
  bool isLoading = true;
  bool hasError = false;
  String searchQuery = ''; // For storing the search input

  final TextEditingController _searchController =
      TextEditingController(); // Controller for the search box
  // List of all districts in Bangladesh
  List<String> bangladeshDistricts = [
    'Dhaka',
    'Chittagong',
    'Rajshahi',
    'Khulna',
    'Barisal',
    'Sylhet',
    'Rangpur',
    'Mymensingh',
    'Comilla',
    'Gazipur',
    'Noakhali',
    'Bogura',
    'Bandarban',
    'Feni',
    'Cox\'s Bazar',

    // Add more districts as necessary
  ];

  // Filtered list of suggestions based on user input
  List<String> filteredDistricts = [];

  @override
  void initState() {
    super.initState();
    weatherInfo = WeatherData(
      name: '',
      temperature: 0,
      condition: '',
      hourlyWeather: [],
      feelsLike: 0,
      humidity: 0,
      windSpeed: 0,
      windDirection: '',
    );
    _fetchCurrentWeatherAndForecast(); // Fetch current weather and forecast data
  }

  Future<void> _fetchCurrentWeatherAndForecast({String? cityName}) async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      if (cityName != null && cityName.isNotEmpty) {
        // Fetch weather data using the searched city name
        final currentWeather =
            await WeatherServices().fetchWeatherByCity(cityName);
        final forecastWeather =
            await WeatherServices().fetchHourlyForecast(cityName: cityName);

        setState(() {
          weatherInfo = WeatherData(
            name: currentWeather.name,
            temperature: currentWeather.temperature,
            condition: currentWeather.condition,
            feelsLike: currentWeather.feelsLike,
            humidity: currentWeather.humidity,
            windSpeed: currentWeather.windSpeed,
            windDirection: currentWeather.windDirection,
            hourlyWeather:
                forecastWeather.hourlyWeather, // Populate with forecast data
          );
          isLoading = false;
          hasError = false;
        });
      } else {
        // Get the user's current location if no city is searched
        Position position = await _getCurrentLocation();

        // Fetch weather data using the user's live location
        final currentWeather = await WeatherServices().fetchCurrentWeather(
          position.latitude,
          position.longitude,
        );
        final forecastWeather =
            await WeatherServices().fetchHourlyForecast(cityName: '');

        setState(() {
          weatherInfo = WeatherData(
            name: currentWeather.name,
            temperature: currentWeather.temperature,
            condition: currentWeather.condition,
            feelsLike: currentWeather.feelsLike,
            humidity: currentWeather.humidity,
            windSpeed: currentWeather.windSpeed,
            windDirection: currentWeather.windDirection,
            hourlyWeather:
                forecastWeather.hourlyWeather, // Populate with forecast data
          );
          isLoading = false;
          hasError = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  // Function to get the current location of the user
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, don't continue
      throw Exception("Location services are disabled.");
    }

    // Check location permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, throw an error
        throw Exception("Location permissions are denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle accordingly
      throw Exception(
          "Location permissions are permanently denied, we cannot request permissions.");
    }

    // Get the current position of the device

    const LocationSettings locationSettings = LocationSettings(accuracy: LocationAccuracy.high,);
    return await Geolocator.getCurrentPosition(locationSettings: locationSettings);
  }

  // Function to handle suggestion selection
  void _selectSuggestion(String suggestion) {
    setState(() {
      _searchController.text =
          suggestion; // Update the text field with the selected suggestion
      _fetchCurrentWeatherAndForecast(
          cityName:
              suggestion); // Fetch weather data for the selected suggestion
    });
  }

  // Method to filter district suggestions based on user input
  void _filterDistricts(String query) {
    setState(() {
      filteredDistricts = bangladeshDistricts
          .where((district) =>
              district.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  String getBackgroundImage(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear sky':
        return 'assets/conditions/clear-sky.png';
      case 'sunny':
        return 'assets/conditions/sunny.png';
      case 'overcast clouds':
        return 'assets/conditions/partly-cloudy.png';
      case 'broken clouds':
        return 'assets/conditions/broken-clouds.png';
      case 'scattered clouds':
        return 'assets/conditions/scattered-clouds.png';
      case 'cloudy':
        return 'assets/conditions/partly-cloudy.png';
      case 'moderate rain':
        return 'assets/conditions/heavy-rain.png';
      case 'extreme rain':
      case 'heavy intensity rain':
        return 'assets/conditions/rainy.png';
      case 'drizzle':
        return 'assets/conditions/drizzle.png';
      case 'light rain':
        return 'assets/conditions/light-rain.png';
      case 'thunderstorm':
      case 'thunderstorm with light rain':
      case 'thunderstorm with heavy rain':
      case 'light thunderstorm':
      case 'heavy thunderstorm':
      case 'thunderstorm with rain':
        return 'assets/conditions/thunder-rain.png';
      case 'dust':
      case 'mist':
      case 'fog':
      case 'haze':
        return 'assets/conditions/haze.png';
      default:
        return 'assets/conditions/sunny.png';
    }
  }

  Color getBackgroundColor() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 18) {
      return const Color(0xFF87CEEB); // Daytime color
    } else {
      return const Color(0xFF191970); // Nighttime color
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE d MMMM, yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: getBackgroundColor(),
      appBar: AppBar(
        title: const Text(
          'Weather Forecast',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: getBackgroundColor(),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Add search bar here
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a city in Bangladesh...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                searchQuery = value;
                _filterDistricts(value); // Update the suggestions as user types
              },
              onSubmitted: (value) {
                _fetchCurrentWeatherAndForecast(cityName: value);
              },
            ),
            const SizedBox(height: 10),
            // Show filtered district suggestions
            if (filteredDistricts.isNotEmpty)
              SizedBox(
                height: 180,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredDistricts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filteredDistricts[index]),
                      onTap: () {
                        // When user taps on a suggestion
                        _fetchCurrentWeatherAndForecast(
                            cityName: filteredDistricts[index]);
                        _selectSuggestion(filteredDistricts[index]);
                        setState(() {
                          searchQuery = filteredDistricts[index];
                          filteredDistricts.clear(); // Clear suggestions
                        });
                      },
                    );
                  },
                ),
              ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : hasError
                        ? const Text(
                            'Failed to load weather data. Please try again later.',
                            style: TextStyle(color: Colors.white),
                          )
                        : SingleChildScrollView(
                            child: WeatherDetail(
                              weather: weatherInfo,
                              formattedDate: formattedDate,
                              backgroundImage: getBackgroundImage(
                                  weatherInfo.condition.isNotEmpty
                                      ? weatherInfo.condition
                                      : 'cloudy'),
                            ),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherDetail extends StatelessWidget {
  final WeatherData weather;
  final String formattedDate;
  final String backgroundImage;

  const WeatherDetail({
    super.key,
    required this.weather,
    required this.formattedDate,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${weather.name}  ${weather.temperature.toStringAsFixed(1)}°C',
          style: const TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          formattedDate,
          style: const TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          DateFormat.jm().format(DateTime.now()),
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(
          weather.condition,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(
          'Feels like ${weather.feelsLike.toStringAsFixed(1)}°C  Humidity: ${weather.humidity}%',
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        Text(
          'Wind: ${weather.windSpeed} km/h ${weather.windDirection}',
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: weather.hourlyWeather.length,
                    itemBuilder: (context, index) {
                      final hourly = weather.hourlyWeather[index];
                      return Column(
                        children: [
                          Text(
                            DateFormat('EEE, MMM d, hh:mm a')
                                .format(hourly.dateTime),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            hourly.condition,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17.5,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              weatherInfoCard(
                                title: 'Temp',
                                icon: Icons.thermostat,
                                value: '${hourly.temperature}°C',
                              ),
                              weatherInfoCard(
                                title: 'Humidity',
                                icon: Icons.water_drop,
                                value: '${hourly.humidity}%',
                              ),
                              weatherInfoCard(
                                icon: Icons.wind_power,
                                title: "Wind",
                                value: "${hourly.windSpeed} km/h",
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget weatherInfoCard(
      {required IconData icon, required String title, required String value}) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
