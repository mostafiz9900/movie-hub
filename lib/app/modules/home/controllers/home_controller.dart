import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_hub/app/data/models/movie.dart';
import 'package:movie_hub/app/data/providers/home_provider.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final isLoder = true.obs;
  final _movies = <MovieModel>[].obs;
  List<MovieModel> get movies => _movies;
  var scrollController = ScrollController();
  var page = 1.obs;
  var isLoderMore = true.obs;
  @override
  void onInit() async {
    super.onInit();

    await getMovies(page.value);
    paginateProductList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getMovies(int pageNum) async {
    isLoder(true);
    isLoderMore(false);
    if (await checkInternetConnectivity()) {
      var getResponse = await HomeProvider().getMovies(pageNum);
      if (getResponse != null) {
        isLoder(false);
        _movies.addAll(getResponse);
      } else {
        print('movies not found');
      }
    } else {
      Get.snackbar("error", "No Internet");
    }
  }

  Future<bool> checkInternetConnectivity() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      // print('Mobile');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // print('Wifi');
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      print('No Connection');
      return false;
    } else {
      return false;
    }
  }

  //  scroll product
  void paginateProductList() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reached end product list");
        page.value++;

        await getMoreMovies(page.value);
        // page++;
        // getMoreTask(page);
      }
    });
  }

  Future<void> getMoreMovies(int numb) async {
    isLoderMore(true);
    if (await checkInternetConnectivity()) {
      var getResponse = await HomeProvider().getMovies(numb);
      if (getResponse != null) {
        isLoderMore(false);
        _movies.addAll(getResponse);
      } else {
        print('movies not found');
      }
    } else {
      Get.snackbar("error", "No Internet");
    }
  }

  Future<void> refreshMovies() async {
    _movies.clear();
    page.value = 1;
    await getMovies(page.value);
  }
}
