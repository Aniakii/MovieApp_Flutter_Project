import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../../../constants/alerts.dart';
import '../../../../constants/color_palette.dart';
import '../../../../data/repositories/movie_database.dart';
import '../../all_movies_screen/all_movies_bloc.dart';


Alert getAlertErrorOnline(BuildContext context) {
  return Alert(
    context: context,
    type: AlertType.error,
    style: const AlertStyle(backgroundColor: Colors.white),
    title: onlineAlertTitle,
    desc: onlineAlertDesc,
    buttons: [
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
          context.read<AllMoviesBloc>().add(FetchDataEvent(context.read<MovieDataBase>()));
        },
        color: brighterPurple,
        child: const Text(
          tryAgainButton,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
          context.read<AllMoviesBloc>().add(LoadDataEvent(context.read<MovieDataBase>()));
        },
        color: darkerPurple,
        child: const Text(
          goOfflineButton,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    ],
  );
}

Alert getAlertErrorOffline(BuildContext context) {
return Alert(
    context: context,
    type: AlertType.warning,
    style: const AlertStyle(backgroundColor: Colors.white),
    title: offlineAlertTitle,
    desc: offlineAlertDesc,
);
}