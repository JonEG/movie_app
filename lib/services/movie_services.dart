import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:movie_app/model/movieList.dart';

Future<String> _loadMoviesAsset() async {
  return await rootBundle.loadString('assets/Films.json');
  //return await rootBundle.loadString('assets/Films.json');
}

Future loadMovies() async {
  String jsonString = await _loadMoviesAsset();
  final jsonResponse = json.decode(jsonString);
  MovieList movieList = MovieList.fromJson(jsonResponse);
  return movieList.movies;
}