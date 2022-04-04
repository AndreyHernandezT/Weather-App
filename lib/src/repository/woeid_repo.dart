import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/woeid_model.dart';

class WoeidRepo{
  /// El atributo de la clase [WoeidRepo] ([searchCity]) es el URL del API metaweather
  String searchCity = 'https://www.metaweather.com/api/location/search/?query=';
  
  /// El método [getWoeid] busca el nombre de la ciudad en el API
  Future<Woeid> getWoeid(String city) async{
    final result = await http.Client().get(Uri.parse(searchCity + city));
    
    if (result.statusCode != 200) {
      throw Exception();
    }
    final resultCity = json.decode(result.body);
    return parsedJsonWoeid(resultCity);
  }

  /// El método [parsedJsonWeid] devuelve el Woeid (Where On Earth ID)  correspondiente 
  /// al nombre de la ciudad
  Woeid parsedJsonWoeid(final response){
    final data = response[0];
    return Woeid.fromJson(data);
  }
}