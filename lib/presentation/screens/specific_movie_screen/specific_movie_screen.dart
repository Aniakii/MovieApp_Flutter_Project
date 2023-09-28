import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/color_palette.dart';
import 'package:movie_app/presentation/screens/specific_movie_screen/widgets/movie_info.dart';
import '../../../data/models/movie.dart';

class SpecificMovieScreen extends StatelessWidget {
  const SpecificMovieScreen(this.selectedMovie);

  static const id = 'specific_movie_screen';

  final Movie selectedMovie;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(selectedMovie.title),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
          Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: brighterPurple,
                ),
              ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: FractionalTranslation(
                        translation: Offset(0.0, 0.15),
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(10.0),
                          width: 200.0,
                          height: 300.0,
                          child: Hero(
                            tag: selectedMovie.id.toString(),
                            child: CachedNetworkImage(
                              imageUrl: selectedMovie.posterImage,
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset('/images/error_image.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
              ],
            ),
            SizedBox(height: 60.0,),
            Container(
                        color: Color(0xff303030),
                        child: MovieInfo(selectedMovie),
                      ),
          ],
        ),
      ),
    );
  }
}
