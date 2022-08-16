// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

List<MovieModel> movieModelFromJson(dynamic str) => List<MovieModel>.from(
    (str as List<dynamic>).map((x) => MovieModel.fromJson(x)));

String movieModelToJson(List<MovieModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel {
  MovieModel({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
  });

  final String? title;
  final String? year;
  final String? imdbId;
  final String? type;
  final String? poster;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json["Title"] == null ? null : json["Title"],
        year: json["Year"] == null ? null : json["Year"],
        imdbId: json["imdbID"] == null ? null : json["imdbID"],
        type: json["Type"] == null ? null : json["Type"],
        poster: json["Poster"] == null ? null : json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title == null ? null : title,
        "Year": year == null ? null : year,
        "imdbID": imdbId == null ? null : imdbId,
        "Type": type == null ? null : type,
        "Poster": poster == null ? null : poster,
      };
}
