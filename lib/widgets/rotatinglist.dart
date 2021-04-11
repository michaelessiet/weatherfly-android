import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherfly/api/api_request.dart';
import 'package:weatherfly/models/dailyweatherdata_model.dart';
import 'package:weatherfly/state%20management/state.dart';

class RotatingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StateStore store = VxState.store;
    return FutureBuilder(
      future: loadDailyWeather(store.searchedLocation, null, null),
      // ignore: missing_return
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return "Check your Internet Connection and Searched location"
                .text
                .white
                .center
                .make()
                .centered();
            break;

          case ConnectionState.waiting:
            return "Loading...".text.white.make().centered().h64(context);

          default:
            List<Datum> data = snapshot.data;

            return VxSwiper.builder(
              viewportFraction: 0.4,
              itemCount: store.dailyweather.length,
              scrollDirection: Axis.vertical,
              height: context.screenHeight / 1.3,
              enlargeCenterPage: true,
              
              enableInfiniteScroll: true,
              itemBuilder: (context, index) {
                var weatherdate =
                    DateTime.parse(data[index].validDate.toString());
                List<Datum> dailyweather = data;
                return VxBox(
                    child: HStack(
                  [
                    VStack(
                      [
                        "${weatherdate.day}/${weatherdate.month}/${weatherdate.year}"
                            .text
                            .color(Vx.white.withOpacity(0.6))
                            .make(),
                        VStack(
                          [
                            "${dailyweather[index].maxTemp}°"
                                .text
                                .color(Vx.white.withOpacity(0.6))
                                .make(),
                            10.heightBox,
                            "${dailyweather[index].temp}°"
                                .text
                                .xl6
                                .white
                                .light
                                .make(),
                            10.heightBox,
                            "${dailyweather[index].minTemp}°"
                                .text
                                .color(Vx.white.withOpacity(0.6))
                                .make(),
                            10.heightBox,
                            dailyweather[index]
                                .weather
                                .description
                                .toString()
                                .text
                                .wrapWords(true)
                                .white
                                .center
                                .make()
                                .w32(context)
                          ],
                          crossAlignment: CrossAxisAlignment.center,
                        )
                      ],
                      alignment: MainAxisAlignment.spaceBetween,
                    ).h(190).px(20),
                    VxBox().height(180).white.width(2).make().p16(),
                    VStack(
                      [
                        "Pressure".text.color(Vx.white.withOpacity(0.6)).make(),
                        "${dailyweather[index].pres.toStringAsFixed(2)}hPa".text.white.make(),
                        10.heightBox,
                        "Precipitation"
                            .text
                            .color(Vx.white.withOpacity(0.6))
                            .make(),
                        "${dailyweather[index].precip.toStringAsFixed(2)}%"
                            .text
                            .white
                            .make(),
                        10.heightBox,
                        "Wind Speed"
                            .text
                            .color(Vx.white.withOpacity(0.6))
                            .make(),
                        "${dailyweather[index].windSpd.toStringAsFixed(2)}km/h"
                            .text
                            .white
                            .make(),
                      ],
                      alignment: MainAxisAlignment.spaceBetween,
                    ).h(195).px(36)
                  ],
                  alignment: MainAxisAlignment.spaceAround,
                )).border(color: Vx.white, width: 1).make();
              },
            ).wFull(context).px12();
        }
      },
    );
  }
}
