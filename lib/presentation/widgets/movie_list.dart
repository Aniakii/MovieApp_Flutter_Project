import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/texts.dart';
import '../screens/all_movies_screen/all_movies_bloc.dart';
import '../screens/movie_screen/movie_screen.dart';
import 'movie_card.dart';

class MovieList extends StatelessWidget {
  const MovieList(this._scrollController);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllMoviesBloc, AllMoviesState>(
      builder: (context, state) {
        if (state.filteredMovies.isNotEmpty) {
          return ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              itemCount: state.filteredMovies.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    MovieCard(
                      positionNumber: index + 1,
                      presentedMovie: state.filteredMovies[index],
                      touchFunction: () {
                        Navigator.pushNamed(context, MovieScreen.id,
                            arguments: state.filteredMovies[index]);
                      },
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                      height: 0.0,
                    ),
                  ],
                );
              });
        } else {
          return const Center(
            child: Text(
              AppTexts.noMoviesText,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    );
  }
}
