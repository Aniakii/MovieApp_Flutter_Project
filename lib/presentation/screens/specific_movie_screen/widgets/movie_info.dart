import 'package:flutter/material.dart';
import '../../../../data/models/movie.dart';

class MovieInfo extends StatelessWidget {

  MovieInfo(this.selectedMovie);

  final Movie selectedMovie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(selectedMovie.title, style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),),
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                Text("POPULARITY", style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(selectedMovie.popularity.toString()),
              ],),
              Column(children: [
                Text("RATE", style: TextStyle(fontWeight: FontWeight.bold),),
                Row(children: [
                  Text(selectedMovie.voteAverage.toString()),
                  Icon(Icons.star, color: Colors.amber, size: 20.0,),
                ]),]),
              Column(children: [
                Text("RELEASE DATE", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(selectedMovie.releaseDate.toLocal().toString().split(' ')[0],),
              ],),
            ],),
          SizedBox(height: 15.0,),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text('Overwiew:',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0), textAlign: TextAlign.left),
          ),
          SizedBox(height: 15.0,),
          Text(selectedMovie.overview, softWrap: true, textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),
        ],
      ),
    );
  }
}
