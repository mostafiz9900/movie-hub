import 'package:get/get.dart';
import 'package:movie_hub/app/data/models/movie_details.dart';

import '../../../data/providers/home_provider.dart';
import '../../home/controllers/home_controller.dart';

class MovieDetailsController extends GetxController {
  final HomeController homeCon = Get.find();
  final _movieDetils = MovieDetailsModel().obs;
  MovieDetailsModel get movieDetail => _movieDetils.value;
  final imdbId = "".obs;
  final isLoder = true.obs;
  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      imdbId.value = Get.arguments;
      await getMovieDetails(imdbId.value);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  Future<void> getMovieDetails(String id) async {
    isLoder(true);

    if (await homeCon.checkInternetConnectivity()) {
      var getResponse = await HomeProvider().getMovieDetails(id);
      if (getResponse != null) {
        isLoder(false);
        _movieDetils.value = getResponse;
      } else {
        print('movies not found');
      }
    } else {
      Get.snackbar("error", "No Internet");
    }
  }
}
