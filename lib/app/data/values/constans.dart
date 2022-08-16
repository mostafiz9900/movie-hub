import 'package:movie_hub/app/data/values/app_config.dart';

class AppConstans {
  AppConstans._();

  static String movieUrl =
      "${AppConfig.baseUrl}?s=Batman&apikey=${AppConfig.apiKey}&";
  static String movieDetailsUrl =
      "${AppConfig.baseUrl}?apikey=${AppConfig.apiKey}&i=";
}
