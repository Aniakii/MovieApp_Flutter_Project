import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:movie_app/presentation/screens/loading_screen/loading_data_bloc.dart';

import '../../constants/color_palette.dart';
import '../../constants/texts.dart';


Alert getAlertErrorOnline(BuildContext context) {
  return Alert(
    context: context,
    type: AlertType.error,
    style: const AlertStyle(backgroundColor: Colors.white),
    title: Alerts.onlineAlertTitle,
    desc: Alerts.onlineAlertDesc,
    buttons: [
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
          context.read<LoadingDataBloc>().add(ChangeLoadingStateEvent());
          context.read<LoadingDataBloc>().add(FetchDataEvent());
        },
        color: AppColors.brighterPurple,
        child: const Text(
          Alerts.tryAgainOnlineButton,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
          context.read<LoadingDataBloc>().add(ChangeLoadingStateEvent());
          context.read<LoadingDataBloc>().add(LoadDataEvent());
        },
        color: AppColors.darkerPurple,
        child: const Text(
          Alerts.goOfflineOnlineButton,
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
    title: Alerts.offlineAlertTitle,
    desc: Alerts.offlineAlertDesc,
  buttons: [
    DialogButton(
      onPressed: () {
        Navigator.pop(context);
          },
      color: AppColors.darkerPurple,
      child: const Text(
        Alerts.offlineButton,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  ]
);
}

Alert getAlertErrorOther(BuildContext context) {
  return Alert(
      context: context,
      type: AlertType.error,
      style: const AlertStyle(backgroundColor: Colors.white),
      title: Alerts.otherAlertTitle,
      desc: Alerts.otherAlertDesc,
    buttons: [
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColors.brighterPurple,
        child: const Text(
          Alerts.okOtherButton,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
          context.read<LoadingDataBloc>().add(ChangeLoadingStateEvent());
          context.read<LoadingDataBloc>().add(LoadDataEvent());
        },
        color: AppColors.darkerPurple,
        child: const Text(
          Alerts.goOfflineOtherButton,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    ],
  );
}