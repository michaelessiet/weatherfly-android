// To parse this JSON data, do
//
//     final forecast = forecastFromJson(jsonfinal);

import 'dart:convert';

Forecast forecastFromJson(final str) => Forecast.fromJson(json.decode(str));

String forecastToJson(Forecast data) => json.encode(data.toJson());

class Forecast {
    Forecast({
        this.data,
    });

    List<Datum> data;

    factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.windCdir,
        this.rh,
        this.pod,
        this.lon,
        this.pres,
        this.timezone,
        this.obTime,
        this.countryCode,
        this.clouds,
        this.vis,
        this.windSpd,
        this.windCdirFull,
        this.appTemp,
        this.stateCode,
        this.ts,
        this.hAngle,
        this.dewpt,
        this.weather,
        this.uv,
        this.aqi,
        this.station,
        this.windDir,
        this.elevAngle,
        this.datetime,
        this.precip,
        this.ghi,
        this.dni,
        this.dhi,
        this.solarRad,
        this.cityName,
        this.sunrise,
        this.sunset,
        this.temp,
        this.lat,
        this.slp,
    });

    final windCdir;
    final rh;
    final pod;
    final lon;
    final pres;
    final timezone;
    final obTime;
    final countryCode;
    final clouds;
    final vis;
    final windSpd;
    final windCdirFull;
    final appTemp;
    final stateCode;
    final ts;
    final hAngle;
    final dewpt;
    Weather weather;
    final uv;
    final aqi;
    final station;
    final windDir;
    final elevAngle;
    final datetime;
    final precip;
    final ghi;
    final dni;
    final dhi;
    final solarRad;
    final cityName;
    final sunrise;
    final sunset;
    final temp;
    final lat;
    final slp;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        windCdir: json["wind_cdir"],
        rh: json["rh"],
        pod: json["pod"],
        lon: json["lon"],
        pres: json["pres"],
        timezone: json["timezone"],
        obTime: json["ob_time"],
        countryCode: json["country_code"],
        clouds: json["clouds"],
        vis: json["vis"],
        windSpd: json["wind_spd"],
        windCdirFull: json["wind_cdir_full"],
        appTemp: json["app_temp"],
        stateCode: json["state_code"],
        ts: json["ts"],
        hAngle: json["h_angle"],
        dewpt: json["dewpt"],
        weather: Weather.fromJson(json["weather"]),
        uv: json["uv"],
        aqi: json["aqi"],
        station: json["station"],
        windDir: json["wind_dir"],
        elevAngle: json["elev_angle"],
        datetime: json["datetime"],
        precip: json["precip"],
        ghi: json["ghi"],
        dni: json["dni"],
        dhi: json["dhi"],
        solarRad: json["solar_rad"],
        cityName: json["city_name"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"],
        lat: json["lat"],
        slp: json["slp"],
    );

    Map<String, dynamic> toJson() => {
        "wind_cdir": windCdir,
        "rh": rh,
        "pod": pod,
        "lon": lon,
        "pres": pres,
        "timezone": timezone,
        "ob_time": obTime,
        "country_code": countryCode,
        "clouds": clouds,
        "vis": vis,
        "wind_spd": windSpd,
        "wind_cdir_full": windCdirFull,
        "app_temp": appTemp,
        "state_code": stateCode,
        "ts": ts,
        "h_angle": hAngle,
        "dewpt": dewpt,
        "weather": weather.toJson(),
        "uv": uv,
        "aqi": aqi,
        "station": station,
        "wind_dir": windDir,
        "elev_angle": elevAngle,
        "datetime": datetime,
        "precip": precip,
        "ghi": ghi,
        "dni": dni,
        "dhi": dhi,
        "solar_rad": solarRad,
        "city_name": cityName,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "lat": lat,
        "slp": slp,
    };
}

class Weather {
    Weather({
        this.icon,
        this.code,
        this.description,
    });

    final icon;
    final code;
    final description;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        icon: json["icon"],
        code: json["code"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "icon": icon,
        "code": code,
        "description": description,
    };
}
