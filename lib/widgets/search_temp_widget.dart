import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherfly/models/weatherdata_model.dart';
import 'package:weatherfly/state%20management/state.dart';
import 'package:weatherfly/api/api_request.dart';

class TempStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StateStore store = VxState.store;
    return FutureBuilder(
      future: loadCurrentWeather(store.searchedLocation),
      // ignore: missing_return
      builder: (context, snapshot) {
        List<Datum> weatherdatalist = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return ""
                .text
                .white
                .center
                .wrapWords(true)
                .make()
                .centered();
            break;

          case ConnectionState.waiting:
            return "Loading...".text.white.make().centered();
            break;

          default:
            Datum weatherdata = weatherdatalist[0];
            return VStack([
              weatherdata.weather.description.toString().text.white.make(),
              "${weatherdata.temp}°".text.white.xl6.light.make().py(6),
              "${weatherdata.cityName},${weatherdata.countryCode}"
                  .text
                  .color(Vx.white.withOpacity(0.6))
                  .make()
            ],crossAlignment: CrossAxisAlignment.center,);
        }
      },
    );
  }
}
