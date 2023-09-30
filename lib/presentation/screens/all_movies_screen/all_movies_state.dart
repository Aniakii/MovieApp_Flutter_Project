part of 'all_movies_bloc.dart';

@freezed
class AllMoviesState with _$AllMoviesState {
  const factory AllMoviesState(
      {required List<Movie> allMovies,
      required List<Genre> allGenres,
      required Genre? selectedGenre,
      required List<Movie> filteredMovies}) = _AllMoviesState;
}
