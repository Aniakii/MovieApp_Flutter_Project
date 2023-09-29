import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/models/movie.dart';
import 'package:movie_app/data/repositories/movie_database.dart';
import 'package:movie_app/presentation/screens/loading_screen/loading_data_bloc.dart';
import 'package:movie_app/presentation/screens/specific_movie_screen/specific_movie_screen.dart';
import 'package:movie_app/presentation/screens/all_movies_screen/all_movies_bloc.dart';
import 'package:movie_app/presentation/screens/all_movies_screen/all_movies_screen.dart';
import 'package:movie_app/presentation/screens/loading_screen/loading_data_screen.dart';

import 'package:movie_app/constants/color_palette.dart';
import 'constants/texts.dart';


void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {

    Route<dynamic> generateRoutes(RouteSettings settings) {
      switch (settings.name) {
        case LoadingScreen.id:
          return MaterialPageRoute(builder: (context) => LoadingScreen());
        case AllMoviesScreen.id:
          return MaterialPageRoute(builder: (context) => AllMoviesScreen());
        case SpecificMovieScreen.id:
          return MaterialPageRoute(
            builder: (context) => SpecificMovieScreen(settings.arguments as Movie),
          );
        default:
          return MaterialPageRoute(builder: (context) => LoadingScreen());
      }
    }

    return RepositoryProvider<MovieDataBase>(
      create: (BuildContext context) => MovieDataBase()..initializeDataBase(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AllMoviesBloc>(create: (context) => AllMoviesBloc(),),
          BlocProvider<LoadingDataBloc>(create: (context) => LoadingDataBloc(context.read<MovieDataBase>()),),
    ],
        child: MaterialApp(
          title: AppTexts.appName,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: AppColors.brighterPurple,
                titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              colorScheme: const ColorScheme.dark()),
          initialRoute: LoadingScreen.id,
          onGenerateRoute: generateRoutes,
        ),
      ),
    );
  }
}
