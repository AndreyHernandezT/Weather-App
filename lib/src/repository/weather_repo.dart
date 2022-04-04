import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:technical_test/src/models/weather_model.dart';

class WeatherRepo{
   /// El atributo de la clase [WeatherRepo] ([searchWeather]) es el URL
   ///  del API metaweather
  String searchWeather = 'https://www.metaweather.com/api/location/';

  /// El método [getWeather] busca el woeid en el API
  Future<WeatherModel> getWeather(String woeid) async{
    final locationResult = await http.Client().get(Uri.parse(searchWeather + woeid));
    
    if (locationResult.statusCode != 200) {
      throw Exception();
    }

    final result = json.decode(locationResult.body);
    final consolidatedWeather = result["consolidated_weather"];
    return parsedJsonWeather(consolidatedWeather);
  }
  /// El método [parsedJsonWeather] devuelve los datos del clima en la
  /// clase [WeatherModel]
  WeatherModel parsedJsonWeather(final response){
    final data = response[0];
    return WeatherModel.fromJson(data);
  }  
}