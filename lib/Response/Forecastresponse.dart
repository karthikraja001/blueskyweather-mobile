import 'dart:convert';
Forecast forecastFromJson(String str) => Forecast.fromJson(json.decode(str));
String forecastToJson(Forecast data) => json.encode(data.toJson());
class Forecast {
    Forecast({
        this.cod,
        this.message,
        this.cnt,
        this.list,
        this.city,
    });
    String cod;
    int message;
    int cnt;
    List<ListElement> list;
    City city;
    factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        cod: json["cod"] == null ? null : json["cod"],
        message: json["message"] == null ? null : json["message"],
        cnt: json["cnt"] == null ? null : json["cnt"],
        list: json["list"] == null ? null : List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
    );
    Map<String, dynamic> toJson() => {
        "cod": cod == null ? null : cod,
        "message": message == null ? null : message,
        "cnt": cnt == null ? null : cnt,
        "list": list == null ? null : List<dynamic>.from(list.map((x) => x.toJson())),
        "city": city == null ? null : city.toJson(),
    };
}
class City {
    City({
        this.id,
        this.name,
        this.country,
        this.population,
        this.timezone,
        this.sunrise,
        this.sunset,
    });
    int id;
    String name;
    String country;
    int population;
    int timezone;
    int sunrise;
    int sunset;
    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        country: json["country"] == null ? null : json["country"],
        population: json["population"] == null ? null : json["population"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
    );
    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "country": country == null ? null : country,
        "population": population == null ? null : population,
        "timezone": timezone == null ? null : timezone,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
    };
}
class ListElement {
    ListElement({
        this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.wind,
        this.visibility,
        this.pop,
        this.sys,
        this.dtTxt,
        this.rain,
    });
    int dt;
    MainClass main;
    List<Weather> weather;
    Clouds clouds;
    Wind wind;
    int visibility;
    double pop;
    Sys sys;
    DateTime dtTxt;
    Rain rain;
    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"] == null ? null : json["dt"],
        main: json["main"] == null ? null : MainClass.fromJson(json["main"]),
        weather: json["weather"] == null ? null : List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        visibility: json["visibility"] == null ? null : json["visibility"],
        pop: json["pop"] == null ? null : json["pop"].toDouble(),
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
    );
    Map<String, dynamic> toJson() => {
        "dt": dt == null ? null : dt,
        "main": main == null ? null : main.toJson(),
        "weather": weather == null ? null : List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds == null ? null : clouds.toJson(),
        "wind": wind == null ? null : wind.toJson(),
        "visibility": visibility == null ? null : visibility,
        "pop": pop == null ? null : pop,
        "sys": sys == null ? null : sys.toJson(),
        "dt_txt": dtTxt == null ? null : dtTxt.toIso8601String(),
        "rain": rain == null ? null : rain.toJson(),
    };
}
class Clouds {
    Clouds({
        this.all,
    });
    int all;
    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"] == null ? null : json["all"],
    );
    Map<String, dynamic> toJson() => {
        "all": all == null ? null : all,
    };
}
class MainClass {
    MainClass({
        this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.seaLevel,
        this.grndLevel,
        this.humidity,
        this.tempKf,
    });
    double temp;
    double feelsLike;
    double tempMin;
    double tempMax;
    int pressure;
    int seaLevel;
    int grndLevel;
    int humidity;
    double tempKf;
    factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"] == null ? null : json["temp"].toDouble(),
        feelsLike: json["feels_like"] == null ? null : json["feels_like"].toDouble(),
        tempMin: json["temp_min"] == null ? null : json["temp_min"].toDouble(),
        tempMax: json["temp_max"] == null ? null : json["temp_max"].toDouble(),
        pressure: json["pressure"] == null ? null : json["pressure"],
        seaLevel: json["sea_level"] == null ? null : json["sea_level"],
        grndLevel: json["grnd_level"] == null ? null : json["grnd_level"],
        humidity: json["humidity"] == null ? null : json["humidity"],
        tempKf: json["temp_kf"] == null ? null : json["temp_kf"].toDouble(),
    );
    Map<String, dynamic> toJson() => {
        "temp": temp == null ? null : temp,
        "feels_like": feelsLike == null ? null : feelsLike,
        "temp_min": tempMin == null ? null : tempMin,
        "temp_max": tempMax == null ? null : tempMax,
        "pressure": pressure == null ? null : pressure,
        "sea_level": seaLevel == null ? null : seaLevel,
        "grnd_level": grndLevel == null ? null : grndLevel,
        "humidity": humidity == null ? null : humidity,
        "temp_kf": tempKf == null ? null : tempKf,
    };
}
class Rain {
    Rain({
        this.the3H,
    });
    double the3H;
    factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the3H: json["3h"] == null ? null : json["3h"].toDouble(),
    );
    Map<String, dynamic> toJson() => {
        "3h": the3H == null ? null : the3H,
    };
}
class Sys {
    Sys({
        this.pod,
    });
    Pod pod;
    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: json["pod"] == null ? null : podValues.map[json["pod"]],
    );
    Map<String, dynamic> toJson() => {
        "pod": pod == null ? null : podValues.reverse[pod],
    };
}
enum Pod { D, N }
final podValues = EnumValues({
    "d": Pod.D,
    "n": Pod.N
});
class Weather {
    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });
    int id;
    MainEnum main;
    Description description;
    Iconz icon;
    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] == null ? null : json["id"],
        main: json["main"] == null ? null : mainEnumValues.map[json["main"]],
        description: json["description"] == null ? null : descriptionValues.map[json["description"]],
        icon: json["icon"] == null ? null : iconValues.map[json["icon"]],
    );
    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "main": main == null ? null : mainEnumValues.reverse[main],
        "description": description == null ? null : descriptionValues.reverse[description],
        "icon": icon == null ? null : iconValues.reverse[icon],
    };
}
enum Description { OVERCAST_CLOUDS, LIGHT_RAIN, SCATTERED_CLOUDS, BROKEN_CLOUDS, CLEAR_SKY }
final descriptionValues = EnumValues({
    "broken clouds": Description.BROKEN_CLOUDS,
    "clear sky": Description.CLEAR_SKY,
    "light rain": Description.LIGHT_RAIN,
    "overcast clouds": Description.OVERCAST_CLOUDS,
    "scattered clouds": Description.SCATTERED_CLOUDS
});
enum Iconz { THE_01_D, THE_01_N, THE_02_D, THE_02_N, THE_03_D, THE_03_N, THE_04_D, THE_04_N, THE_09_D, THE_09_N, THE_10_D, THE_10_N, THE_11_D, THE_11_N, THE_13_D, THE_13_N, THE_50_D, THE_50_N }
final iconValues = EnumValues({
    "01n": Iconz.THE_01_N,
    "01d": Iconz.THE_01_D,
    "02n": Iconz.THE_02_N,
    "02d": Iconz.THE_02_D,
    "03n": Iconz.THE_03_N,
    "03d": Iconz.THE_03_D,
    "04d": Iconz.THE_04_D,
    "04n": Iconz.THE_04_N,    
    "09n": Iconz.THE_09_N,
    "09d": Iconz.THE_09_D,
    "10n": Iconz.THE_10_N,
    "10d": Iconz.THE_10_D,
    "11d": Iconz.THE_11_D,
    "13d": Iconz.THE_13_D,
    "50d": Iconz.THE_50_D,
    "11n": Iconz.THE_11_N,
    "13n": Iconz.THE_13_N,
    "50n": Iconz.THE_50_N,
});
enum MainEnum { CLOUDS, RAIN, CLEAR }
final mainEnumValues = EnumValues({
    "Clear": MainEnum.CLEAR,
    "Clouds": MainEnum.CLOUDS,
    "Rain": MainEnum.RAIN
});
class Wind {
    Wind({
        this.speed,
        this.deg,
    });
    double speed;
    int deg;
    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"] == null ? null : json["speed"].toDouble(),
        deg: json["deg"] == null ? null : json["deg"],
    );
    Map<String, dynamic> toJson() => {
        "speed": speed == null ? null : speed,
        "deg": deg == null ? null : deg,
    };
}
class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;
    EnumValues(this.map);
    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}