import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../constants/color_palette.dart';
import '../screens/loading_data_screen/bloc/loading_data_bloc.dart';

Alert getAlertErrorOnline(BuildContext context) {
  return Alert(
    context: context,
    type: AlertType.error,
    style: const AlertStyle(backgroundColor: Colors.white),
    title: S.of(context)!.onlineAlertTitle,
    desc: S.of(context)!.onlineAlertDesc,
    buttons: [
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
          context.read<LoadingDataBloc>().add(ChangeLoadingStateEvent());
          context.read<LoadingDataBloc>().add(FetchDataEvent());
        },
        color: AppColors.brighterPurple,
        child: Text(
          S.of(context)!.tryAgainOnlineButton,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
          context.read<LoadingDataBloc>().add(ChangeLoadingStateEvent());
          context.read<LoadingDataBloc>().add(LoadDataEvent());
        },
        color: AppColors.darkerPurple,
        child: Text(
          S.of(context)!.goOfflineOnlineButton,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    ],
  );
}

Alert getAlertErrorOffline(BuildContext context) {
  return Alert(
    context: context,
    type: AlertType.warning,
    style: const AlertStyle(
      backgroundColor: Colors.white,
    ),
    title: S.of(context)!.offlineAlertTitle,
    desc: S.of(context)!.offlineAlertDesc,
    buttons: [
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColors.darkerPurple,
        child: Text(
          S.of(context)!.offlineButton,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    ],
  );
}

Alert getAlertErrorOther(BuildContext context) {
  return Alert(
    context: context,
    type: AlertType.error,
    style: const AlertStyle(
      backgroundColor: Colors.white,
    ),
    title: S.of(context)!.otherAlertTitle,
    desc: S.of(context)!.otherAlertDesc,
    buttons: [
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColors.brighterPurple,
        child: Text(
          S.of(context)!.okOtherButton,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
          context.read<LoadingDataBloc>().add(ChangeLoadingStateEvent());
          context.read<LoadingDataBloc>().add(LoadDataEvent());
        },
        color: AppColors.darkerPurple,
        child: Text(
          S.of(context)!.goOfflineOtherButton,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    ],
  );
}
