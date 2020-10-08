import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/movieList.dart';
import 'package:movie_app/ui/movieListViewDetails.dart';

class MovieListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Movie> movieList = [];

    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        backgroundColor: Colors.blueGrey.shade900,
        body: Container(
          child: Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/Films.json'),
                builder: (context, snapshot) {
                  // Decode the JSON
                  var jsonResponse = json.decode(snapshot.data.toString());
                  MovieList jsonMovies = (MovieList.fromJson(jsonResponse));
                  //We must check that it is not null before accessing to movies
                  if (jsonMovies != null) {
                    movieList = jsonMovies.movies;
                  }

                  return ListView.builder(
                      itemCount: movieList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(children: <Widget>[
                          movieCard(movieList[index], context),
                          Positioned(
                              top: 10.0,
                              child: movieImage(movieList[index].images[0])),
                        ]);
                        // return Card(
                        //   color: Colors.white,
                        //   elevation: 7.0,
                        //   child: ListTile(
                        //     leading: CircleAvatar(
                        //       child: Container(
                        //         width: 200,
                        //         height: 200,
                        //         decoration: BoxDecoration(
                        //             image: DecorationImage(
                        //                 image: NetworkImage(movieList[index].images[0]),
                        //                 fit: BoxFit.cover
                        //             ),
                        //             color: Colors.transparent,
                        //             borderRadius: BorderRadius.circular(20.0)),
                        //         child: Text(""),
                        //       ),
                        //     ),
                        //     title: Text(movieList[index].title),
                        //     subtitle: Text(movieList[index].genre),
                        //     trailing: Text("..."),
                        //     onTap: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   MovieListViewDetails(
                        //                     selectedMovie: movieList[index],
                        //                   )));
                        //     },
                        //   ),
                        // );
                      });
                }),
          ),
        ));
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 50),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black26,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        movie.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.white),
                      ),
                    ),
                    Text(
                      "Rating: ${movie.imbdRating}/10",
                      style: mainTextStyle(),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "Released ${movie.released}",
                      style: mainTextStyle(),
                    ),
                    Text(
                      movie.runtime,
                      style: mainTextStyle(),
                    ),
                    Text(
                      movie.rated,
                      style: mainTextStyle(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movie: movie,
                    )));
      },
    );
  }

  TextStyle mainTextStyle(){
    return TextStyle(
        fontSize: 15.0,
        color: Colors.white60
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ??
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT7sm5Mc_-7mF6ja6vXo-H_H9JmybWFqPNfAA&usqp=CAU"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
