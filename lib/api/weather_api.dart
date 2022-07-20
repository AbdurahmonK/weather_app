import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';

class WeatherApi {
  Future<WeatherForecast> weather({String? cityName}) async {
    Map<String, String> queryParams = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName.toString(),
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH, queryParams);
    var res = await http.get(uri);
    log('request: ${uri.toString()}');
    log('res: ${res.body}');
    if (res.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(res.body));
    } else {
      throw Exception('Error response');
    }
  }
}
