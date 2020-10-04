import 'package:flutter/material.dart';
import 'package:movie_app/ui/movieListViewDetails.dart';

class MovieListView extends StatelessWidget {
  final List _movieList = [
    "Pulp Fiction",
    "The Dark Knight",
    "Fight Club",
    "The Lord of the Rings: The Two Towers"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: _movieList.length,
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
                title: Text(_movieList[index]),
                subtitle: Text("Movie Subtitle"),
                trailing: Text("..."),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieListViewDetails(
                            movieTitle: _movieList[index],)));
                },
                /*
                onTap: () {
                  debugPrint("MOVIE NAME ");
                },*/
              ),
            );
          }),
    );
  }
}
