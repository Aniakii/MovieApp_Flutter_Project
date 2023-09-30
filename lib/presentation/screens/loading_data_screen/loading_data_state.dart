part of 'loading_data_bloc.dart';

@freezed
class LoadingDataState with _$LoadingDataState {
  const factory LoadingDataState(
      {required LoadingDataStatus status,
      required List<Movie> allMovies,
      required List<Genre> allGenres}) = _LoadingDataState;
}
