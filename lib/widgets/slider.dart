import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherfly/state%20management/state.dart';
import 'package:weatherfly/state%20management/state_mutation.dart';

class SliderCarousel extends StatefulWidget {
  @override
  _SliderCarouselState createState() => _SliderCarouselState();
}

class _SliderCarouselState extends State<SliderCarousel> {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [LoadCoordinateWeather, LoadDailyWeatherData]);
    StateStore store = VxState.store;
    return VxSwiper.builder(
      viewportFraction: 0.9,
      itemCount: store.dailyweather.length,
      height: 250,
      enableInfiniteScroll: false,
      itemBuilder: (context, index) {
        var weatherdate =
            DateTime.parse(store.dailyweather[index].validDate.toString());
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
                    "${store.dailyweather[index].maxTemp}°"
                        .text
                        .color(Vx.white.withOpacity(0.6))
                        .make(),
                    10.heightBox,
                    "${store.dailyweather[index].temp}°"
                        .text
                        .xl6
                        .white
                        .light
                        .make(),
                    10.heightBox,
                    "${store.dailyweather[index].minTemp}°"
                        .text
                        .color(Vx.white.withOpacity(0.6))
                        .make(),
                    10.heightBox,
                    store.dailyweather[index].weather.description
                        .toString()
                        .text
                        .white
                        .make()
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                )
              ],
              alignment: MainAxisAlignment.spaceBetween,
            ).h(190).px(20),
            VxBox().height(180).white.width(2).make().p16(),
            VStack([
              "Pressure".text.color(Vx.white.withOpacity(0.6)).make(),
              "${store.dailyweather[index].pres}hPa".text.white.make(),
              10.heightBox,
              "Precipitation".text.color(Vx.white.withOpacity(0.6)).make(),
              "${store.dailyweather[index].precip.toStringAsFixed(2)}%".text.white.make(),
              10.heightBox,
              "Wind Speed".text.color(Vx.white.withOpacity(0.6)).make(),
              "${store.dailyweather[index].windSpd.toStringAsFixed(2)}km/h".text.white.make(),
            ], alignment: MainAxisAlignment.spaceBetween,).h(195).px(36)
          ],
          alignment: MainAxisAlignment.spaceAround,
        )).border(color: Vx.white, width: 1).make();
      },
    ).wFull(context);
  }
}
