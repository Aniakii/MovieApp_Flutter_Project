import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/data/repositories/movie_database.dart';
import 'package:movie_app/presentation/screens/all_movies_screen/all_movies_bloc.dart';
import 'package:movie_app/presentation/screens/all_movies_screen/all_movies_screen.dart';
import 'package:movie_app/presentation/screens/loading_screen/loading_screen.dart';
import 'package:movie_app/constants/color_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/screens/specific_movie_screen/specific_movie_screen.dart';
import 'package:provider/provider.dart';
import 'data/models/movie.dart';


void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AllMoviesBloc>(
      create: (context) => AllMoviesBloc(),
      child: Provider<MovieDataBase>(

        create: (BuildContext context) => MovieDataBase()..initializeDataBase(),
        child: MaterialApp(
          title: 'Movie Finder',
          theme: appTheme,
          initialRoute: LoadingScreen.id,
          onGenerateRoute: (settings){
            switch (settings.name) {
              case LoadingScreen.id:
                return MaterialPageRoute(builder: (context) => LoadingScreen());
              case AllMoviesScreen.id:
                return MaterialPageRoute(builder: (context) => AllMoviesScreen());
              case SpecificMovieScreen.id:
                return MaterialPageRoute(builder: (context) => SpecificMovieScreen(settings.arguments as Movie));
            }
          },
        ),
      ),
    );
  }
}
