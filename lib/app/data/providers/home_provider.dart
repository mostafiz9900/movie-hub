import 'package:get/get.dart';
import 'package:movie_hub/app/data/models/movie_details.dart';

import '../models/movie.dart';
import '../values/constans.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<MovieModel>?> getMovies(int page) async {
    String url = AppConstans.movieUrl + "page=$page";
    print('$url');

    try {
      var response = await get(url);
      if (response.statusCode == 200) {
        List<dynamic> model = response.body['Search'];
        return movieModelFromJson(model);
      } else {
        return [];
      }
    } catch (error) {
      print('movies data not found $error');
      return [];
    }
  }

  Future<MovieDetailsModel?> getMovieDetails(String imdbId) async {
    String url = AppConstans.movieDetailsUrl + imdbId;
    print('$url');

    try {
      var response = await get(url);
      print(response.body);
      if (response.statusCode == 200) {
        return MovieDetailsModel.fromJson(response.body);
      } else {
        return null;
      }
    } catch (error) {
      print('movies data not found $error');
    }
  }
}
