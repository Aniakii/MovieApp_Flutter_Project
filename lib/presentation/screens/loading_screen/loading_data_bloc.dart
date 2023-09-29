import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/genre.dart';
import '../../../data/models/movie.dart';
import '../../../data/repositories/movie_api.dart';
import '../../../data/repositories/movie_database.dart';

import '../../../constants/enums.dart';


part 'loading_data_bloc.freezed.dart';


class LoadingDataBloc extends Bloc<LoadingDataEvent, LoadingDataState> {

  final MovieDataBase movieDataBase;

  LoadingDataBloc(this.movieDataBase) : super(const LoadingDataState(status: LoadingDataStatus.loading, allGenres: [], allMovies: [], )) {
    on<FetchDataEvent> (_onFetchDataEvent);
    on<LoadDataEvent> (_onLoadDataEvent);
    on<ChangeLoadingStateEvent> (_onChangeLoadingStateEvent);
  }

  Future<void> _onFetchDataEvent(FetchDataEvent event, Emitter<LoadingDataState> emit) async {

    MovieAPI movieAPI = MovieAPI();
    try {

      List<Movie> allMovies = await movieAPI.getMovies();
      List<Genre> allGenres = await movieAPI.getGenres();

      for (Movie movie in allMovies) {
        movie.genresAsString(allGenres);
      }

      movieDataBase.saveData(allMovies, allGenres);
      emit(state.copyWith(allMovies: allMovies, allGenres: allGenres, status: LoadingDataStatus.ready));
    } catch (e) {
      if(e is SocketException) {
        emit(state.copyWith(status: LoadingDataStatus.errorOnline));
      }
      else {
        emit(state.copyWith(status: LoadingDataStatus.errorOther));
      }
    }
  }

  void _onLoadDataEvent(LoadDataEvent event, Emitter<LoadingDataState> emit) {

    try {
      movieDataBase.loadFromDatabase();

      if (movieDataBase.movies.isEmpty || movieDataBase.genres.isEmpty) {
        // emit(LoadingDataState(status: LoadingDataStatus.errorOffline, allGenres: [], allMovies: []));
        emit(state.copyWith(status: LoadingDataStatus.errorOffline));
      } else {
        // emit(LoadingDataState(status: LoadingDataStatus.ready, allGenres: movieDataBase.genres, allMovies: movieDataBase.movies));
        emit(state.copyWith(allMovies: movieDataBase.movies, allGenres: movieDataBase.genres, status: LoadingDataStatus.ready));
      }
    } catch (e)
    {
      emit(state.copyWith(status: LoadingDataStatus.errorOther));
    }

  }

  void _onChangeLoadingStateEvent(ChangeLoadingStateEvent event, Emitter<LoadingDataState> emit) {
    emit(state.copyWith(status: LoadingDataStatus.loading));
  }

}

@freezed
class LoadingDataState with _$LoadingDataState {

  const factory LoadingDataState({required LoadingDataStatus status, required List<Movie> allMovies, required List<
      Genre> allGenres}) = _LoadingDataState;
}

abstract class LoadingDataEvent {
}

class ChangeLoadingStateEvent extends LoadingDataEvent {

}
class FetchDataEvent extends LoadingDataEvent {

}

class LoadDataEvent extends LoadingDataEvent {
}
