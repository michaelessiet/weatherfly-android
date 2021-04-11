# Weatherfly

An android app made with Flutter and the Weatherbit API

## Intro

This project is a Flutter project made using VelocityX and Location Pub Packages and the Weatherbit api. 

The idea behind the app was just a simple test of the packages and the API listed above. Even though it is not a heavy implementation of the packages it is enough to consider these packages production ready.

The package behind the state management in this app is Velocity X and the package behind the front end code is also Velocity X. Even though this packages has some bugs but they are very few and it is very rare to run into any.

```dart
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
```
>The above sample code is the code found in the Home.dart file. As you can see its very short and concise compared to native flutter code written to carry out the same functionality.

## Getting Started 
Make sure to run ```flutter run dart``` after copying this repo and don't forget that this project is specifically built using the Weatherbit API, so other API keys won't work you have to use your own Weatherbit API key.

For help getting started with [Velocity X](https://github.com/iampawan/VelocityX), view the [online documentation](https://velocityx.dev/docs),
it offers tutorials, example images and code samples as well.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
