import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/constants/enums.dart';

import '../../../data/models/genre.dart';
import '../../../data/models/movie.dart';

part 'all_movies_bloc.freezed.dart';
part 'all_movies_event.dart';
part 'all_movies_state.dart';

class AllMoviesBloc extends Bloc<AllMoviesEvent, AllMoviesState> {
  AllMoviesBloc()
      : super(const AllMoviesState(
            allGenres: [],
            allMovies: [],
            filteredMovies: [],
            selectedGenre: null)) {
    on<CreateInitialStateEvent>(_createInitialState);
    on<SelectGenreEvent>(_onSelectGenreEvent);
    on<SortMoviesEvent>(_onSortMoviesEvent);
    on<SearchMovieByPatternEvent>(_onSearchMovieByPatternEvent);
  }

  void _createInitialState(
      CreateInitialStateEvent event, Emitter<AllMoviesState> emit) {
    emit(state.copyWith(
        allMovies: event.allMovies,
        allGenres: event.allGenres,
        filteredMovies: event.allMovies));
  }

  void _onSelectGenreEvent(
      SelectGenreEvent event, Emitter<AllMoviesState> emit) {
    if (event.selectedGenre != null) {
      List<Movie> filteredMovies = state.allMovies
          .where(
              (Movie movie) => movie.genres.contains(event.selectedGenre?.id))
          .toList();
      emit(state.copyWith(
          filteredMovies: filteredMovies, selectedGenre: event.selectedGenre));
    } else {
      emit(state.copyWith(
          selectedGenre: event.selectedGenre, filteredMovies: state.allMovies));
    }
  }

  void _onSortMoviesEvent(SortMoviesEvent event, Emitter<AllMoviesState> emit) {
    List<Movie> filteredMovies = List.of(state.filteredMovies);

    switch (event.sortingType) {
      case SortingType.fromZtoA:
        filteredMovies.sort((a, b) => b.title.compareTo(a.title));
      case SortingType.fromAtoZ:
        filteredMovies.sort((a, b) => a.title.compareTo(b.title));
      case SortingType.bestRate:
        filteredMovies.sort((a, b) => b.voteAverage.compareTo(a.voteAverage));
      case SortingType.worstRate:
        filteredMovies.sort((a, b) => a.voteAverage.compareTo(b.voteAverage));
      case SortingType.mostPopular:
        filteredMovies.sort((a, b) => b.popularity.compareTo(a.popularity));
      case SortingType.leastPopular:
        filteredMovies.sort((a, b) => a.popularity.compareTo(b.popularity));
      case SortingType.defaultSorting:
        filteredMovies.sort((a, b) {
          final indexOfA = state.allMovies.indexOf(a);
          final indexOfB = state.allMovies.indexOf(b);
          return indexOfA.compareTo(indexOfB);
        });
    }

    emit(state.copyWith(filteredMovies: filteredMovies));
  }

  void _onSearchMovieByPatternEvent(
      SearchMovieByPatternEvent event, Emitter<AllMoviesState> emit) {
    List<Movie> matchedMovies = state.allMovies
        .where((Movie movie) =>
            movie.title.toLowerCase().contains(event.textPattern))
        .toList();
    emit(state.copyWith(filteredMovies: matchedMovies));
  }
}
