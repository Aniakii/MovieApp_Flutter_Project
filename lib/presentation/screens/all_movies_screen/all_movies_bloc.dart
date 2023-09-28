import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/data/repositories/movie_api.dart';
import 'package:movie_app/data/repositories/movie_database.dart';
import '../../../data/models/genre.dart';
import '../../../data/models/movie.dart';
import 'package:movie_app/constants/enums.dart';

part 'all_movies_bloc.freezed.dart';

class AllMoviesBloc extends Bloc<AllMoviesEvent, AllMoviesState> {


  AllMoviesBloc():super(AllMoviesState(allGenres: [], allMovies: [], status: AllMoviesStatus.loading, filteredMovies: [], selectedGenre: null)) {

    on<FetchDataEvent> (_onFetchDataEvent);
    on<LoadDataEvent> (_onLoadDataEvent);
    on<SelectGenreEvent> (_onSelectGenreEvent);
    on<SortMoviesEvent>(_onSortMoviesEvent);
    on<SearchMovieByPatternEvent>(_onSearchMovieByPatternEvent);

  }

  Future<void> _onFetchDataEvent(FetchDataEvent event, Emitter<AllMoviesState> emit) async {

    MovieAPI movieAPI = MovieAPI();
    try {

      List<Movie> allMovies = await movieAPI.getMovies();
      List<Genre> allGenres = await movieAPI.getGenres();

      for (Movie movie in allMovies) {
        movie.genresAsString(allGenres);
      }

      event.movieDataBase.saveData(allMovies, allGenres);
      emit(state.copyWith(allMovies: allMovies, allGenres: allGenres, status: AllMoviesStatus.ready, filteredMovies: allMovies));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: AllMoviesStatus.errorOnline));
    }
  }

  Future<void> _onLoadDataEvent(LoadDataEvent event, Emitter<AllMoviesState> emit) async {
    
    event.movieDataBase.loadFromDatabase();

    if (event.movieDataBase.movies.isEmpty || event.movieDataBase.genres.isEmpty) {
      emit(state.copyWith(status: AllMoviesStatus.errorOffline));
    } else {
      emit(state.copyWith(allMovies: event.movieDataBase.movies, allGenres: event.movieDataBase.genres, status: AllMoviesStatus.ready,filteredMovies: event.movieDataBase.movies));
    }
  }

  void _onSelectGenreEvent(SelectGenreEvent event, Emitter<AllMoviesState> emit) {

    if (event.selectedGenre != null) {
      List<Movie> filteredMovies = state.allMovies.where((Movie movie) => movie.genres.contains(event.selectedGenre?.id)).toList();

      emit(state.copyWith(filteredMovies: filteredMovies, selectedGenre: event.selectedGenre));
    } else {
      emit(state.copyWith(selectedGenre: event.selectedGenre));
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
      }

      emit(state.copyWith(filteredMovies: filteredMovies));
  }

  void _onSearchMovieByPatternEvent(SearchMovieByPatternEvent event, Emitter<AllMoviesState> emit) {

    List<Movie> matchedMovies = state.allMovies.where((Movie movie) => movie.title.toLowerCase().contains(event.textPattern)).toList();
    emit(state.copyWith(filteredMovies: matchedMovies));
  }
}

@freezed
class AllMoviesState with _$AllMoviesState {

  const factory AllMoviesState({required List<Movie> allMovies, required List<
      Genre> allGenres, required AllMoviesStatus status, required Genre? selectedGenre, required List<
      Movie> filteredMovies}) = _AllMoviesState;
}

abstract class AllMoviesEvent {
}

class FetchDataEvent extends AllMoviesEvent {

  final MovieDataBase movieDataBase;

  FetchDataEvent(this.movieDataBase);
}

class LoadDataEvent extends AllMoviesEvent {

  final MovieDataBase movieDataBase;

  LoadDataEvent(this.movieDataBase);
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