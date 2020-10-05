import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/movieList.dart';
import 'package:movie_app/ui/movieListViewDetails.dart';

class MovieListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Movie> movieList= [];

    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        backgroundColor: Colors.blueGrey.shade400,
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
                    if(jsonMovies!=null){
                      movieList=jsonMovies.movies;
                    }

                  return ListView.builder(
                      itemCount: movieList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.white,
                          elevation: 7.0,
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(14.0)),
                                child: Text("m"),
                              ),
                            ),
                            title: Text(movieList[index].title),
                            subtitle: Text(movieList[index].plot),
                            trailing: Text("..."),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MovieListViewDetails(
                                            movieTitle: movieList[index].title,
                                          )));
                            },
                          ),
                        );
                      });
                }),
          ),
        ));
  }
}
