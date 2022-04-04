class WeatherModel{
  final int temp;
  final double pressure;
  final int humedity;
  final int wind;
  final int tempMax;
  final int tempMin;
  final String weatherState;
  final String icon;

  WeatherModel(
    this.temp,
    this.pressure,
    this.humedity,
    this.wind,
    this.tempMax,
    this.tempMin,
    this.weatherState,
    this.icon
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
      json["the_temp"],
      json["air_pressure"],
      json["humidity"],
      json["wind_speed"],
      json["max_temp"],
      json["min_temp"],
      json["weather_state_name"],
      json["weather_state_abbr"]
    );
  }
}