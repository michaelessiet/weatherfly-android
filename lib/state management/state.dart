import 'package:velocity_x/velocity_x.dart';
import 'package:weatherfly/models/dailyweatherdata_model.dart' as dailyweathermodel;
import 'package:weatherfly/models/weatherdata_model.dart';

class StateStore extends VxStore {
  String location = "Washington";
  String searchedLocation;
  List hourlyweather;
  List<dailyweathermodel.Datum> dailyweather;
  var locationlong;
  var locationlat;
  Datum weatherData;
}
