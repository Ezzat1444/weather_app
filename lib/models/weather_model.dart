class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weatherStatus;
  final double wind;
  final double? humidity;
  final double chanceOfrain;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherStatus,
       required this.wind,
       required this.humidity,
       required this.chanceOfrain,
      });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['current']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherStatus: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      wind: json['current']['wind_kph'],
      humidity: (json['forecast']['forecastday'][0]['day']['avghumidity'] as num?)?.toDouble() ?? 0.0,
       chanceOfrain: (json['forecast']['forecastday'][0]['day']['daily_will_it_rain'] as num?)?.toDouble() ?? 0.0,
      
      
    );
  }
}
