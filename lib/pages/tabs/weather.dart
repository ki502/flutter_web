import 'package:flutter/material.dart';
import 'package:flutter_web/utils/apiCaller.dart';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new WeatherState();
}

class WeatherState extends State<Weather> {
  late var dongResponse;
  late DateTime now;
  late var weatherDatas;

  @override
  void initState() {
    super.initState();
    dongResponse = ApiCaller.getApi(getWeatherUrl());
  }

  String getWeatherUrl() {
    List<int> timeList = [
      2310,
      2010,
      1710,
      1410,
      1110,
      0810,
      0510,
      0210,
    ];

    this.now = DateTime.now().toLocal();
    int nowTime = 100 * this.now.hour + this.now.minute;
    int baseTime = 0;
    String yyyyMMdd = DateFormat('yyyyMMdd').format(this.now);

    timeList.forEach((element) {
      if (baseTime == 0 && nowTime > element) {
        baseTime = element;
        return;
      }
    });

    baseTime = baseTime == 0 ? timeList[timeList.length - 1] : baseTime;

    String serviceKey =
        "rLd8MtvxuXsobQjgTa%2B4PYgH81uIDiljPEM9m9N2c6Xr1OaMCXIg1nA%2FZGx9oUxTFSfJW2TzsEJQFQKcRJ42Sw%3D%3D";
    String url =
        "https://cors-anywhere.herokuapp.com/http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=${serviceKey}&numOfRows=55&pageNo=1&dataType=JSON&base_date=${yyyyMMdd}&base_time=${baseTime}&nx=61&ny=129&=";

    print(url);
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.lightBlue.shade50),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        height: 220,
        child: FutureBuilder(
          future: this.dongResponse,
          builder: (buildContext, snapshot) {
            if (snapshot.hasData) {
              this.weatherDatas = convertWeatherAsDateTime(snapshot.data);

              DateTime baseTime = this.now;

              String yyyyMMddhhmm = DateFormat('yyyyMMddHH00').format(this.now);

              if (this.weatherDatas[yyyyMMddhhmm] == null) {
                baseTime = this.now.add(Duration(hours: 1));
                yyyyMMddhhmm = DateFormat('yyyyMMddHH00').format(baseTime);
              }

              var nowDatas = this.weatherDatas[yyyyMMddhhmm];

              String nowTemperature = nowDatas["TMP"] + "℃";
              String nowWeather = getWeatherText(nowDatas);
              String rainPersent = "강수(" + nowDatas['POP'] + "%)";

              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          getWeatherIcon(nowWeather),
                          SizedBox(
                            width: 10,
                          ),
                          Text("$nowTemperature/$nowWeather/$rainPersent"),
                        ],
                      ),
                      Text("방학1동"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [0, 1, 2, 3, 4].map((element) {
                        DateTime calcurateDateTime =
                            baseTime.add(Duration(hours: element));
                        String yyyyMMddhhmm = DateFormat('yyyyMMddHH00')
                            .format(calcurateDateTime);

                        var weatherData = this.weatherDatas[yyyyMMddhhmm];

                        if (weatherData == null) {
                          return Container();
                        }

                        String nowWeather = getWeatherText(weatherData);
                        String nowTemperature = nowDatas["TMP"] + "℃";
                        String rainPersent = "강수(" + nowDatas['POP'] + "%)";

                        return Column(
                          children: [
                            Text(calcurateDateTime.hour.toString() + "시"),
                            SizedBox(
                              height: 5,
                            ),
                            getWeatherIcon(nowWeather),
                            SizedBox(
                              height: 5,
                            ),
                            Text("$nowTemperature"),
                            SizedBox(
                              height: 5,
                            ),
                            Text("$rainPersent"),
                          ],
                        );
                      }).toList())
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      )
    ]);
  }

  String getWeatherText(element) {
    int value = int.parse(element["SKY"]);
    String text = "맑음";

    text = value == 0
        ? text
        : value == 3
            ? "구름많음"
            : value == 4
                ? "흐림"
                : "없는 코드";

    value = int.parse(element["PTY"]);

    text = value == 0
        ? text
        : value == 1
            ? "비"
            : value == 2
                ? "비/눈"
                : value == 3
                    ? "눈"
                    : "소나기";

    return text;
  }

  Icon getWeatherIcon(String nowWeather) {
    return Icon(nowWeather == "맑음"
        ? Icons.wb_sunny
        : nowWeather == "비"
            ? Icons.umbrella
            : nowWeather == "비/눈"
                ? Icons.storm
                : nowWeather == "눈"
                    ? Icons.ac_unit
                    : nowWeather == "소나기"
                        ? Icons.beach_access
                        : nowWeather == "구름많음"
                            ? Icons.cloud
                            : nowWeather == "흐림"
                                ? Icons.cloud_circle_sharp
                                : Icons.question_answer);
  }

  Map<String, Map<String, String>> convertWeatherAsDateTime(var datas) {
    Map<String, Map<String, String>> timeList =
        new Map<String, Map<String, String>>();

    Map<String, dynamic> data = datas as Map<String, dynamic>;

    if (data["response"]["header"]["resultCode"] != "00") {
      return {};
    }

    List<dynamic> items = data["response"]["body"]["items"]["item"];

    items.forEach((element) {
      String key = element["fcstDate"] + element["fcstTime"];

      if (timeList[key] == null) {
        timeList[key] = new Map<String, String>();
      }

      String category = element["category"];

      timeList[key]![category] = element["fcstValue"];
    });

    return timeList;
  }
}
