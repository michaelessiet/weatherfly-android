import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherfly/api/api_key_parser.dart';
import 'package:weatherfly/models/api_key_model.dart';
import 'package:weatherfly/models/dailyweatherdata_model.dart';
import 'package:weatherfly/models/weatherdata_model.dart'
    as currentweather_model;


Future<KeyModel> apiKey = KeyLoader(json_file_path: "apiKey.json").load();

Future<List<currentweather_model.Datum>> loadCurrentWeather(location) async {
  var key = await apiKey;

  var apiUri = Uri.https('api.weatherbit.io', '/v2.0/current',
      {'city': location.toString(), 'key': key.apiKey.toString()});

  var response = await http.get(apiUri);

  final modeldata = currentweather_model.forecastFromJson(response.body);

  return modeldata.data;
}

Future loadCurrentWeatherwithCoord({lat, long}) async {
  var key = await apiKey;

  var apiUri = Uri.https('api.weatherbit.io', '/v2.0/current', {
    'lat': lat.toString(),
    'lon': long.toString(),
    'key': key.apiKey.toString()
  });

  // CoordinateFixer(lat: lat, long: long).perform();

  var response = await http.get(apiUri);

  return response.body;
}

Future<List<Datum>> loadDailyWeather(location, lat, long) async {
  var key = await apiKey;

  if (lat == null) {
    var locationapiUri = Uri.https(
        'api.weatherbit.io', '/v2.0/forecast/daily', {
      'city': location.toString(),
      'key': key.apiKey.toString(),
      'days': '7'
    });

    var locationresponse = await http.get(locationapiUri);

    // print(locationresponse.body);

    final modeldata = dailyWeatherFromJson(locationresponse.body);

    return modeldata.data;
  }

  var coord = Uri.https('api.weatherbit.io', '/v2.0/forecast/daily', {
    'lat': lat.toString(),
    'lon': long.toString(),
    'key': key.apiKey.toString(),
    'days': '7'
  });

  var coordresponse = await http.get(coord);

  // print(coordresponse.body);

  final modeldata = dailyWeatherFromJson(coordresponse.body);

  // return coordresponse.body;
  return modeldata.data;
}
