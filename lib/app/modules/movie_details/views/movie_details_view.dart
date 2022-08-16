import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_hub/app/data/models/rating.dart';

import '../controllers/movie_details_controller.dart';

class MovieDetailsView extends GetView<MovieDetailsController> {
  @override
  Widget build(BuildContext context) {
    Widget fixedSize = const SizedBox(
      height: 15,
    );
    Widget middelfixedSize = const SizedBox(
      height: 10,
    );
    Widget smallfixedSize = const SizedBox(
      height: 5,
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(() => controller.isLoder.value
              ? LinearProgressIndicator(
                  color: Colors.redAccent.shade400,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          width: Get.width,
                          height: Get.height * 0.4,
                          imageUrl: '${controller.movieDetail.poster}',
                          errorWidget: (context, url, error) {
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
                                child: InkWell(
                                  onTap: () => Get.back(),
                                  child: Container(
                                    margin:
                                        const EdgeInsets.only(left: 8, top: 8),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(90)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ))),
                      ],
                    ),
                    fixedSize,
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.movieDetail.title!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          middelfixedSize,
                          Text(
                            'IMDB Rating : ${controller.movieDetail.imdbRating}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          middelfixedSize,
                          ListView.builder(
                            itemCount: controller.movieDetail.ratings!.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              Rating model = controller.movieDetail.ratings!
                                  .elementAt(index);
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${model.source}'),
                                      Text('${model.value}'),
                                    ],
                                  ),
                                  middelfixedSize,
                                ],
                              );
                            },
                          ),
                          Text(
                            'Votes : ${controller.movieDetail.imdbVotes}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          middelfixedSize,
                          Text(
                            'Year : ${controller.movieDetail.year}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          middelfixedSize,
                          Text(
                            'Language : ${controller.movieDetail.language}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          middelfixedSize,
                          Text(
                            'Country : ${controller.movieDetail.country}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          middelfixedSize,
                          Text(
                            'Awards : ${controller.movieDetail.awards}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          middelfixedSize,
                          Text(
                            'Rated : ${controller.movieDetail.rated}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          middelfixedSize,
                          Text(
                            'Released : ${controller.movieDetail.released}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          middelfixedSize,
                          Text(
                            'Runtime : ${controller.movieDetail.runtime}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          middelfixedSize,
                          Text(
                            'Director : ${controller.movieDetail.director}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          middelfixedSize,
                          Text(
                            'Actors : ${controller.movieDetail.actors}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          middelfixedSize,
                          Text(
                            'Genre : ${controller.movieDetail.genre}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          middelfixedSize,
                          Text(
                            'Writer : ${controller.movieDetail.writer}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          middelfixedSize,
                          Text(
                            'Plot : ${controller.movieDetail.plot}',
                            style: const TextStyle(
                                fontSize: 16,
                                letterSpacing: 2,
                                decorationThickness: 5,
                                wordSpacing: 2),
                          ),
                        ],
                      ),
                    ),
                    fixedSize
                  ],
                )),
        ),
      ),
    );
  }
}
