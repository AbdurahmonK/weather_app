import '../utils/forecast_util.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';

class CityView extends StatelessWidget {
  const CityView({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;
  @override
  Widget build(BuildContext context) {
    var city = snapshot.data?.city?.name;
    var date = snapshot.data?.list?[0].dt;
    var country = snapshot.data?.city?.country;
    var formattedDate = DateTime.fromMillisecondsSinceEpoch(date! * 1000);
    return Column(
      children: <Widget>[
        Text('$city, $country'),
        Text(Util.getFormattedDate(formattedDate)),
      ],
    );
  }
}
