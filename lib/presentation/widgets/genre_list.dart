import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/all_movies_screen/all_movies_bloc.dart';
import 'genre_selector.dart';

class GenreList extends StatelessWidget {
  const GenreList(this.scrollToTop);

  final void Function() scrollToTop;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllMoviesBloc, AllMoviesState>(
        builder: (BuildContext context, AllMoviesState state) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.allGenres.length,
        itemBuilder: (BuildContext context, int index) {
          return GenreSelector(
            name: state.allGenres[index].name,
            id: state.allGenres[index].id,
            chooseGenre: () {
              if (state.selectedGenre == state.allGenres[index]) {
                context.read<AllMoviesBloc>().add(SelectGenreEvent(null));
              } else {
                context
                    .read<AllMoviesBloc>()
                    .add(SelectGenreEvent(state.allGenres[index]));
              }
              scrollToTop();
            },
            isSelected: state.selectedGenre == state.allGenres[index],
          );
        },
      );
    });
  }
}
