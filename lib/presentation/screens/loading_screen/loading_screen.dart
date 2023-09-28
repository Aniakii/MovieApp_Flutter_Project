import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:movie_app/constants/color_palette.dart';
import 'package:movie_app/data/repositories/movie_database.dart';
import 'package:movie_app/presentation/screens/all_movies_screen/all_movies_screen.dart';
import 'package:movie_app/presentation/screens/loading_screen/widgets/error_alerts.dart';
import '../../../constants/enums.dart';
import '../all_movies_screen/all_movies_bloc.dart';

class LoadingScreen extends StatefulWidget {

  static const id = 'loading_screen';

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    context.read<AllMoviesBloc>().add(FetchDataEvent(context.read<MovieDataBase>()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AllMoviesBloc, AllMoviesState>(
      listener: (context, state) {
        if (state.status == AllMoviesStatus.ready) {
          Navigator.of(context).pushReplacementNamed(AllMoviesScreen.id);
        } else if (state.status == AllMoviesStatus.errorOnline) {
          getAlertErrorOnline(context).show();
        }
        else if(state.status == AllMoviesStatus.errorOffline) {
          getAlertErrorOffline(context).show();
        }
      },
      child: Scaffold(
        backgroundColor: darkerPurple,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SpinKitFadingCircle(
                color: brighterPurple,
                size: 100.0,
              ),
              const SizedBox(height: 50.0),
              DefaultTextStyle(
                style: const TextStyle(fontSize: 20.0),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText('Loading data...',
                        textStyle: const TextStyle(fontSize: 30.0)),
                    TypewriterAnimatedText('Wait a moment...',
                        textStyle: const TextStyle(fontSize: 30.0)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
