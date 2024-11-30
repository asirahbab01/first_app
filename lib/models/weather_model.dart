class WeatherData {
  final String name;
  final double temperature;
  final double feelsLike;
  final String condition;
  final int humidity;
  final double windSpeed;  
  final String windDirection;
  final List<HourlyWeather> hourlyWeather;

  WeatherData({
    required this.name,
    required this.temperature,
    required this.feelsLike,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
    required this.hourlyWeather,
  });

  // Factory constructor for current weather data
  factory WeatherData.fromCurrentWeatherJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json['name'],
      temperature: json['main']['temp'].toDouble(),
      condition: json['weather'][0]['description'],
      hourlyWeather: [],  // Empty list since this is current weather
      feelsLike: json['main']['feels_like'].toDouble(), 
      humidity: json['main']['humidity'].toInt(),  
      windSpeed: json['wind']['speed'].toDouble(), 
      windDirection: _getWindDirection(json['wind']['deg']), 
    );
  }

  // Factory constructor for hourly forecast data
  factory WeatherData.fromHourlyForecastJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json['city']['name'],
      temperature: 0, // Not relevant for the forecast, handled by HourlyWeather
      condition: '', // Not relevant for the forecast, handled by HourlyWeather
      hourlyWeather: (json['list'] as List)
          .map((item) => HourlyWeather.fromJson(item))
          .toList(), feelsLike: 0, humidity: 0, windSpeed: 0, windDirection: '',
    );
  }
  
  static String _getWindDirection(int degrees) {
    if (degrees >= 337.5 || degrees < 22.5) {
      return 'N';
    } else if (degrees >= 22.5 && degrees < 67.5) {
      return 'NE';
    } else if (degrees >= 67.5 && degrees < 112.5) {
      return 'E';
    } else if (degrees >= 112.5 && degrees < 157.5) {
      return 'SE';
    } else if (degrees >= 157.5 && degrees < 202.5) {
      return 'S';
    } else if (degrees >= 202.5 && degrees < 247.5) {
      return 'SW';
    } else if (degrees >= 247.5 && degrees < 292.5) {
      return 'W';
    } else if (degrees >= 292.5 && degrees < 337.5) {
      return 'NW';
    }
    return 'Unknown';
  }
}

class HourlyWeather {
  final DateTime dateTime;
  final double temperature;
  final int humidity;
  final double windSpeed;
  final String condition;

  HourlyWeather({
    required this.dateTime,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.condition,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      dateTime: DateTime.parse(json['dt_txt']),
      temperature: json['main']['temp'].toDouble(),
      humidity: json['main']['humidity'].toInt(),
      windSpeed: json['wind']['speed'].toDouble(),
      condition: json['weather'][0]['main'],
    );
  }
}
