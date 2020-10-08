class Movie {
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String metascore;
  final String imbdRating;
  final String imbdVotes;
  final String imbdID;
  final String type;
  final String response;
  final List<String> images;

  Movie(
      {this.title,
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
      this.metascore,
      this.imbdRating,
      this.imbdVotes,
      this.imbdID,
      this.type,
      this.response,
      this.images});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return new Movie(
      title: json['Title'],
      year: json['Year'],
      rated: json['Rated'].toString(),
      released: json['Released'].toString(),
      runtime: json['Runtime'].toString(),
      genre: json['Genre'].toString(),
      director: json['Director'].toString(),
      writer: json['Writer'].toString(),
      actors: json['Actors'].toString(),
      plot: json['Plot'].toString(),
      language: json['Language'].toString(),
      country: json['Country'].toString(),
      awards: json['Awards'].toString(),
      poster: json['Poster'].toString(),
      metascore: json['Metascore'].toString(),
      imbdRating: json['imdbRating'].toString(),
      imbdVotes: json['imdbVotes'].toString(),
      imbdID: json['imdbID'].toString(),
      type: json['Type'].toString(),
      response: json['Response'].toString(),
      images: new List<String>.from(json['Images']),
    );
  }

  @override
  String toString() {
    return 'Movie{title: $title, year: $year, rated: $rated, released: $released,'
        ' runtime: $runtime, genre: $genre, director: $director, '
        'writer: $writer, actors: $actors, plot: $plot,'
        ' language: $language, country: $country, awards: $awards,'
        ' poster: $poster, metascore: $metascore, imbdRating: $imbdRating, '
        'imbdVotes: $imbdVotes, imbdID: $imbdID, type: $type,'
        ' response: $response, images: $images}';
  }
}
