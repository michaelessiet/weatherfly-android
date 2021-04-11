import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherfly/api/api_request.dart';
import 'package:weatherfly/state%20management/state.dart';
import 'package:weatherfly/state%20management/state_mutation.dart';
import 'package:weatherfly/widgets/background_widget.dart';
import 'package:weatherfly/widgets/future_slider.dart';
import 'package:weatherfly/widgets/searchbar.dart';
import 'package:weatherfly/widgets/slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StateStore store = VxState.store;

    bool doIHaveData() {
      if (store.weatherData == null) return false;
      return true;
    }

    bool doIHaveListData() {
      if (store.dailyweather == null) return false;
      return true;
    }

    return VxBuilder(
        mutations: {
          CoordinateFixer,
          LoadCoordinateWeather,
          LoadDailyWeatherData
        },
        builder: (context, _) => Background(
              child: VStack([
                VStack(
                  [
                    VStack([
                      "Hi,".text.thin.xl6.white.make(),
                      "I'm Weatherfly".text.thin.xl6.white.make(),
                      10.heightBox,
                      "Would you like to check the weather of a certain city?"
                          .text
                          .white
                          .make(),
                      20.heightBox,
                      SearchBar()
                    ]).py16().centered(),
                    doIHaveData()
                        ? VStack(
                            [
                              store.weatherData.weather.description
                                  .toString()
                                  .text
                                  .white
                                  .make(),
                              "${store.weatherData.temp}°"
                                  .text
                                  .xl6
                                  .light
                                  .white
                                  .make()
                                  .p12(),
                              "${store.weatherData.cityName},${store.weatherData.countryCode}"
                                  .text
                                  .color(Vx.white.withOpacity(0.5))
                                  .make()
                            ],
                            crossAlignment: CrossAxisAlignment.center,
                          ).centered()
                        : "Loading...".text.white.make().centered(),
                  ],
                  alignment: MainAxisAlignment.spaceAround,
                ).h64(context).p24(),
                // doIHaveListData()?
                FutureSliderCarousel()
                // : 'Loading...'.text.white.make().centered()
              ]),
            ));
  }
}
