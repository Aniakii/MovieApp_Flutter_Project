import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../data/models/movie.dart';

class MovieCard extends StatelessWidget {

  MovieCard({required this.positionNumber, required this.presentedMovie, required this.touchFunction});

  final int positionNumber;
  final Movie presentedMovie;
  final void Function() touchFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 50.0,
            child: Center(child: Text(positionNumber.toString(), style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),))),
        GestureDetector(
          onTap: touchFunction,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Hero(tag: presentedMovie.id.toString(),
            child: CachedNetworkImage(
              imageUrl: presentedMovie.posterImage,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.asset('assets/images/error_image.png', width: 95.0, height: 200,),
            ),),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text(presentedMovie.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0), softWrap: true, overflow: TextOverflow.ellipsis, maxLines: 3,),
            Text((presentedMovie.releaseDate.year).toString()),
            Text('Genre:\n${presentedMovie.stringGenres ?? ''}',softWrap: true, maxLines: 3, overflow: TextOverflow.ellipsis,),
          ],
          ),
        ),
        Expanded(flex: 1, child: Icon(Icons.star, color: Colors.amber,)),
        Expanded(flex: 1, child: Text(presentedMovie.voteAverage.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),)),
      ],),
    );
  }
}
