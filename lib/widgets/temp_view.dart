import 'package:flutter/material.dart';
import '../models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  const TempView({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;
  @override
  Widget build(BuildContext context) {
    var list = snapshot.data?.list;
    var icon = list?[0].getIconUrl();
    var temp = list?[0].temp?.day?.toStringAsFixed(0);
    var desc = list?[0].weather?[0].description?.toUpperCase();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(icon!, scale: 0.5),
        const SizedBox(height: 20),
        Column(
          children: <Widget>[
            Text('$temp °C'),
            Text('$desc °C'),
          ],
        ),
      ],
    );
  }
}
