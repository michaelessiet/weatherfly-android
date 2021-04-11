import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherfly/api/api_request.dart';
import 'package:weatherfly/models/weatherdata_model.dart';
import 'package:weatherfly/pages/city.dart';
import 'package:weatherfly/state%20management/state.dart';

class SetSearchParameter extends VxMutation<StateStore> {
  String searchvalue;
  var context;
  SetSearchParameter({this.context, this.searchvalue});
  perform() {
    store.searchedLocation = searchvalue;
    // ignore: missing_return
    next(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CityPage()));
    });
  }
}

class CoordinateFixer extends VxMutation<StateStore> {
  final lat;
  final long;

  CoordinateFixer({this.lat, this.long});

  @override
  perform() async {
    store.locationlat = lat;
    store.locationlong = long;
    next(() {
      LoadCoordinateWeather();
      LoadDailyWeatherData();
    });
  }
}

class LoadCoordinateWeather extends VxMutation<StateStore> {
  @override
  perform() async {
    var data = await loadCurrentWeatherwithCoord(
        lat: store.locationlat, long: store.locationlong);
    var modeldata = forecastFromJson(data);
    store.weatherData = modeldata.data[0];

    // next(() => LoadDailyWeatherData());
  }
}

class LoadDailyWeatherData extends VxMutation<StateStore> {
  @override
  perform() async {
    var data =
        await loadDailyWeather(null, store.locationlat, store.locationlong);
    store.dailyweather = data;
  }
}

class WeatherDataFixer extends VxMutation<StateStore> {
  @override
  perform() {
    loadCurrentWeatherwithCoord(
        lat: store.locationlat, long: store.locationlong);
  }
}
