import 'package:flutter/material.dart';
import '../models/weather_forecast_daily.dart';
import 'package:weather_app/utils/forecast_util.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;
  @override
  Widget build(BuildContext context) {
    var list = snapshot.data?.list;
    var pressure = list?[0].pressure;
    var humidity = list?[0].humidity;
    var wind = list?[0].speed;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Util.getItem(Icons.thermostat, pressure! * 0.750062.round(), 'mm Hg'),
        Util.getItem(Icons.cloud, humidity!, '%'),
        Util.getItem(Icons.speed, wind!.toInt(), 'm/s'),
      ],
    );
  }
}
