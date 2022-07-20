import 'package:flutter/material.dart';
import 'package:weather_app/utils/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var list = snapshot.data?.list;
  var dayOfWeek = '';
  DateTime date = DateTime.fromMillisecondsSinceEpoch(list[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0];
  var tempMin = list[index].temp.day.toStringAsFixed(0);
  var icon = list[index].getIconUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dayOfWeek),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$tempMin °C'),
                  ),
                  Image.network(icon),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
