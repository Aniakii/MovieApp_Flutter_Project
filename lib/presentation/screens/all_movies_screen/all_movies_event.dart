part of 'all_movies_bloc.dart';

abstract class AllMoviesEvent {}

class CreateInitialStateEvent extends AllMoviesEvent {
  final List<Movie> allMovies;
  final List<Genre> allGenres;

  CreateInitialStateEvent({required this.allMovies, required this.allGenres});
}

class SelectGenreEvent extends AllMoviesEvent {
  final Genre? selectedGenre;

  SelectGenreEvent(this.selectedGenre);
}

class SortMoviesEvent extends AllMoviesEvent {
  final SortingType sortingType;

  SortMoviesEvent(this.sortingType);
}

class SearchMovieByPatternEvent extends AllMoviesEvent {
  final String textPattern;

  SearchMovieByPatternEvent(this.textPattern);
}
