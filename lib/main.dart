import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/constants/color_palette.dart';
import 'package:movie_app/data/repositories/movie_database.dart';
import 'package:movie_app/presentation/screens/all_movies_screen/all_movies_bloc.dart';
import 'package:movie_app/presentation/screens/all_movies_screen/all_movies_screen.dart';
import 'package:movie_app/presentation/screens/loading_data_screen/loading_data_bloc.dart';
import 'package:movie_app/presentation/screens/loading_data_screen/loading_data_screen.dart';
import 'package:movie_app/presentation/screens/movie_screen/movie_screen.dart';

import 'constants/texts.dart';
import 'data/models/movie.dart';

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
        case MovieScreen.id:
          return MaterialPageRoute(
            builder: (context) => MovieScreen(settings.arguments as Movie),
          );
        default:
          return MaterialPageRoute(builder: (context) => LoadingScreen());
      }
    }

    return RepositoryProvider<MovieDataBase>(
      create: (BuildContext context) => MovieDataBase()..initializeDataBase(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AllMoviesBloc>(
            create: (context) => AllMoviesBloc(),
          ),
          BlocProvider<LoadingDataBloc>(
            create: (context) => LoadingDataBloc(context.read<MovieDataBase>()),
          ),
        ],
        child: MaterialApp(
          title: AppTexts.appName,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: AppColors.brighterPurple,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              colorScheme: const ColorScheme.dark()),
          initialRoute: LoadingScreen.id,
          onGenerateRoute: generateRoutes,
        ),
      ),
    );
  }
}
