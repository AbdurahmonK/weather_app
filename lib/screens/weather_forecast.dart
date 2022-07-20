import '../api/weather_api.dart';
import '../screens/city_screen.dart';
import 'package:flutter/material.dart';
import '../models/weather_forecast_daily.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/temp_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/bottom_list_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;

  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().weather(cityName: 'Tashkent');
    // forecastObject.then((weather) => print(weather.list?[0].weather?[0].main));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text('weather app'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.location_city),
            onPressed: () async {
              var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CityScreen();
              }));

              if (typedName != null) {
                setState(() {
                  forecastObject = WeatherApi().weather(cityName: typedName);
                });
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder<WeatherForecast>(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const SizedBox(height: 50.0),
                    CityView(snapshot: snapshot),
                    const SizedBox(height: 50.0),
                    TempView(snapshot: snapshot),
                    const SizedBox(height: 50.0),
                    DetailView(snapshot: snapshot),
                    const SizedBox(height: 50.0),
                    BottomListView(snapshot: snapshot)
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            future: forecastObject,
          ),
        ],
      ),
    );
  }
}
