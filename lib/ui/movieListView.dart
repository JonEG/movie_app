
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
        itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              elevation: 7.0,
              child: ListTile(
                title: Text("Movie"),
                subtitle: Text("Movie Subtitle"),
              ),
            );
          }
        
      ),
    );
  }
}
