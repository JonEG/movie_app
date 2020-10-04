import 'package:flutter/material.dart';

class MovieListViewDetails extends StatelessWidget {
  final String movieTitle;

  const MovieListViewDetails({Key key, this.movieTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies --> ${this.movieTitle}"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Container(
        child: Center(
            child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Go back"),
        )),
      ),
    );
  }
}
