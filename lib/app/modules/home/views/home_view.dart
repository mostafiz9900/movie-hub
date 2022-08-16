import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_hub/app/data/models/movie.dart';
import 'package:movie_hub/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('MovieList'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(
              Routes.SETTING,
            ),
            icon: const Icon(
              Icons.settings,
              size: 40,
            ),
            padding: EdgeInsets.only(right: 20),
          )
        ],
      ),
      body: Obx(
        () => controller.isLoder.value
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: controller.refreshMovies,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                            controller: controller.scrollController,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    // crossAxisCount: 2,
                                    // mainAxisSpacing: 16,
                                    // crossAxisSpacing: 8,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16.0,
                                    mainAxisSpacing: 16.0,
                                    mainAxisExtent: 250),
                            padding: const EdgeInsets.only(top: 10),
                            itemCount: controller.movies.length,
                            itemBuilder: (context, index) {
                              MovieModel model =
                                  controller.movies.elementAt(index);
                              return InkWell(
                                onTap: () => Get.toNamed(Routes.MOVIE_DETAILS,
                                    arguments: model.imdbId),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Get.theme.cardColor,
                                      borderRadius: BorderRadius.circular(4.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.grey.withOpacity(0.10),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: const Offset(0, 0))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Stack(
                                          children: [
                                            CachedNetworkImage(
                                              width: Get.width,
                                              height: Get.height,
                                              imageUrl: '${model.poster}',
                                              errorWidget:
                                                  (context, url, error) {
                                                return const Center(
                                                    child: Icon(
                                                  Icons.error,
                                                  size: 100,
                                                ));
                                              },
                                              fit: BoxFit.cover,
                                            ),
                                            Positioned.fill(
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "${model.year}",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color:
                                                            Colors.pinkAccent,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                          child: Text(
                                            "${model.title}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      if (controller.isLoderMore.value == true)
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 20),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Color(0xffff6600),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
