import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:movie_app/constants/color_palette.dart';
import 'package:movie_app/data/repositories/movie_database.dart';
import 'package:movie_app/presentation/screens/all_movies_screen/all_movies_screen.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
          Alert(
            context: context,
            type: AlertType.error,
            style: AlertStyle(backgroundColor: Colors.white),
            title: "NO INTERNET CONNECTION",
            desc: "It seems that you don't have an internet connection to download movie data. Do you want to try again loading data or show data from yours device memory (offline mode)?",
            buttons: [
              DialogButton(
                child: Text(
                  "TRY AGAIN",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  context.read<AllMoviesBloc>().add(FetchDataEvent(context.read<MovieDataBase>()));
                  },
                color: brighterPurple,
              ),
              DialogButton(
                child: Text(
                  "GO OFFLINE",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  context.read<AllMoviesBloc>().add(LoadDataEvent(context.read<MovieDataBase>()));
                },
                color: darkerPurple,
        ),
            ],
          ).show();
        }
        else if(state.status == AllMoviesStatus.errorOffline) {
          Alert(
            context: context,
            type: AlertType.warning,
            style: AlertStyle(backgroundColor: Colors.white),
            title: "NO DATA IN DEVICES MEMORY",
            desc: "It seems that you haven't used the app yet and there is no data saved on your device. Close the app and open it when you have internet connection."
          ).show();
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
