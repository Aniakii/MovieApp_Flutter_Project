import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/screens/all_movies_screen/all_movies_screen.dart';

import '../../../constants/enums.dart';
import '../../widgets/error_alerts.dart';
import '../../widgets/error_loading_data.dart';
import '../../widgets/loading_data.dart';
import '../all_movies_screen/bloc/all_movies_bloc.dart';
import 'bloc/loading_data_bloc.dart';

class LoadingScreen extends StatefulWidget {
  static const id = 'loading_screen';

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LoadingDataBloc>().add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoadingDataBloc, LoadingDataState>(
      listener: (context, state) {
        if (state.status == LoadingDataStatus.ready) {
          context.read<AllMoviesBloc>().add(CreateInitialStateEvent(
              allMovies: state.allMovies, allGenres: state.allGenres));
          Navigator.of(context).pushReplacementNamed(AllMoviesScreen.id);
        } else if (state.status == LoadingDataStatus.errorOnline) {
          getAlertErrorOnline(context).show();
        } else if (state.status == LoadingDataStatus.errorOffline) {
          getAlertErrorOffline(context).show();
        } else if (state.status == LoadingDataStatus.errorOther) {
          getAlertErrorOther(context).show();
        }
      },
      builder: (BuildContext context, LoadingDataState state) {
        if (state.status == LoadingDataStatus.loading ||
            state.status == LoadingDataStatus.ready) {
          return const LoadingDataWidget();
        } else {
          return const ErrorLoadingDataWidget();
        }
      },
    );
  }
}
