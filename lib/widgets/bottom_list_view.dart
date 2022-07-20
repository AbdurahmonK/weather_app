import 'package:flutter/material.dart';
import 'package:weather_app/widgets/forecast_card.dart';
import '../models/weather_forecast_daily.dart';

class BottomListView extends StatelessWidget {
  const BottomListView({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;
  @override
  Widget build(BuildContext context) {
    var list = snapshot.data?.list;
    // var pressure = list?[0].pressure;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Weekly weather forecast'.toUpperCase()),
        Container(
          height: 140,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: list!.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              color: Colors.amberAccent,
              child: forecastCard(snapshot, index),
            ),
          ),
        ),
      ],
    );
  }
}
