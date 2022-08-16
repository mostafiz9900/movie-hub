// To parse this JSON data, do
//
//     final movieDetailsModel = movieDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:movie_hub/app/data/models/rating.dart';

MovieDetailsModel movieDetailsModelFromJson(String str) =>
    MovieDetailsModel.fromJson(json.decode(str));

String movieDetailsModelToJson(MovieDetailsModel data) =>
    json.encode(data.toJson());

class MovieDetailsModel {
  MovieDetailsModel({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.ratings,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbId,
    this.type,
    this.dvd,
    this.boxOffice,
    this.production,
    this.website,
    this.response,
  });

  final String? title;
  final String? year;
  final String? rated;
  final String? released;
  final String? runtime;
  final String? genre;
  final String? director;
  final String? writer;
  final String? actors;
  final String? plot;
  final String? language;
  final String? country;
  final String? awards;
  final String? poster;
  final List<Rating>? ratings;
  final String? metascore;
  final String? imdbRating;
  final String? imdbVotes;
  final String? imdbId;
  final String? type;
  final String? dvd;
  final String? boxOffice;
  final String? production;
  final String? website;
  final String? response;

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        title: json["Title"] == null ? null : json["Title"],
        year: json["Year"] == null ? null : json["Year"],
        rated: json["Rated"] == null ? null : json["Rated"],
        released: json["Released"] == null ? null : json["Released"],
        runtime: json["Runtime"] == null ? null : json["Runtime"],
        genre: json["Genre"] == null ? null : json["Genre"],
        director: json["Director"] == null ? null : json["Director"],
        writer: json["Writer"] == null ? null : json["Writer"],
        actors: json["Actors"] == null ? null : json["Actors"],
        plot: json["Plot"] == null ? null : json["Plot"],
        language: json["Language"] == null ? null : json["Language"],
        country: json["Country"] == null ? null : json["Country"],
        awards: json["Awards"] == null ? null : json["Awards"],
        poster: json["Poster"] == null ? null : json["Poster"],
        ratings: json["Ratings"] == null
            ? null
            : List<Rating>.from(json["Ratings"].map((x) => Rating.fromJson(x))),
        metascore: json["Metascore"] == null ? null : json["Metascore"],
        imdbRating: json["imdbRating"] == null ? null : json["imdbRating"],
        imdbVotes: json["imdbVotes"] == null ? null : json["imdbVotes"],
        imdbId: json["imdbID"] == null ? null : json["imdbID"],
        type: json["Type"] == null ? null : json["Type"],
        dvd: json["DVD"] == null ? null : json["DVD"],
        boxOffice: json["BoxOffice"] == null ? null : json["BoxOffice"],
        production: json["Production"] == null ? null : json["Production"],
        website: json["Website"] == null ? null : json["Website"],
        response: json["Response"] == null ? null : json["Response"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title == null ? null : title,
        "Year": year == null ? null : year,
        "Rated": rated == null ? null : rated,
        "Released": released == null ? null : released,
        "Runtime": runtime == null ? null : runtime,
        "Genre": genre == null ? null : genre,
        "Director": director == null ? null : director,
        "Writer": writer == null ? null : writer,
        "Actors": actors == null ? null : actors,
        "Plot": plot == null ? null : plot,
        "Language": language == null ? null : language,
        "Country": country == null ? null : country,
        "Awards": awards == null ? null : awards,
        "Poster": poster == null ? null : poster,
        "Ratings": ratings == null
            ? null
            : List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "Metascore": metascore == null ? null : metascore,
        "imdbRating": imdbRating == null ? null : imdbRating,
        "imdbVotes": imdbVotes == null ? null : imdbVotes,
        "imdbID": imdbId == null ? null : imdbId,
        "Type": type == null ? null : type,
        "DVD": dvd == null ? null : dvd,
        "BoxOffice": boxOffice == null ? null : boxOffice,
        "Production": production == null ? null : production,
        "Website": website == null ? null : website,
        "Response": response == null ? null : response,
      };
}
