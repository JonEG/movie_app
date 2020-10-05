import 'package:movie_app/model/movie.dart';

class MovieList {
  final List<Movie> movies;

  MovieList({
    this.movies,
  });

  factory MovieList.fromJson(List<dynamic> parsedJson) {
    if(parsedJson==null) return null;
    List<Movie> movies = new List<Movie>();
    movies = parsedJson.map((i)=> Movie.fromJson(i)).toList();
    return new MovieList(
      movies: movies,
    );
  }

  @override
  String toString() {
    return 'MovieList{movies: $movies}';
  }
}