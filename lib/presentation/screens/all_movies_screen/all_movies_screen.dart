import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/presentation/screens/all_movies_screen/all_movies_bloc.dart';
import 'package:movie_app/presentation/screens/specific_movie_screen/specific_movie_screen.dart';
import 'package:movie_app/data/models/sort_menu_item.dart';
import '../../widgets/genre_selector.dart';
import '../../widgets/header.dart';
import '../../widgets/movie_card.dart';

import '../../../constants/texts.dart';
import '../../../constants/others.dart';
import 'package:movie_app/constants/color_palette.dart';
import 'package:movie_app/constants/enums.dart';

class AllMoviesScreen extends StatefulWidget {

  static const id = 'all_movies_screen';

  @override
  State<AllMoviesScreen> createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {

  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  List<PopupMenuItem<SortingType>> getPopUpItems() {
    List<PopupMenuItem<SortingType>> preparedWidgets = [];
    for (SortMenuItem sortMenuItem in sortMenuItems) {
      preparedWidgets.add(PopupMenuItem<SortingType>(
        value: sortMenuItem.sortType,
        child: Row(
          children: [
            Icon(sortMenuItem.icon),
            const SizedBox(width: 8.0),
            Text(sortMenuItem.description),
          ],
        ),
      ));
    }
    return preparedWidgets;
  }

  @override
  Widget build(BuildContext context) {

    String textPattern = '';
    return BlocBuilder<AllMoviesBloc, AllMoviesState>(
      builder: (context, state) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.brighterPurple,
      appBar: AppBar(
        title: const Text(AppTexts.appName), automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 1,
              child: Header(),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: cardDecoration,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: _textEditingController,
                            onChanged: (value) {
                              textPattern = value;
                            },
                            decoration: textFieldDecoration,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search, color: Colors.white.withOpacity(0.5),),
                          onPressed: () {
                            context.read<AllMoviesBloc>().add(SearchMovieByPatternEvent(textPattern));
                            FocusScope.of(context).unfocus();
                            _textEditingController.clear();
                            },
                        ),
                        PopupMenuButton<SortingType>(
                          onSelected: (SortingType sortingType) {
                            context.read<AllMoviesBloc>().add(SortMoviesEvent(sortingType));
                            _scrollToTop();
                            },
                          child: Icon(Icons.swap_vert, color: Colors.white.withOpacity(0.5),),
                          itemBuilder: (BuildContext context) => getPopUpItems(),
                      ),
                    ],),
                    const SizedBox(height: 15.0),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.allGenres.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GenreSelector(name: state.allGenres[index].name, id: state.allGenres[index].id, chooseGenre: (){
                            if (state.selectedGenre==state.allGenres[index]) {
                              context.read<AllMoviesBloc>().add(SelectGenreEvent(null));
                            } else {
                              context.read<AllMoviesBloc>().add(SelectGenreEvent(state.allGenres[index]));
                              }
                            _scrollToTop();
                          }, isSelected: state.selectedGenre==state.allGenres[index],);
                        },
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Expanded(
                      flex: 4,
                      child: BlocBuilder<AllMoviesBloc, AllMoviesState>(
                        builder: (context, state) {
                          if(state.filteredMovies.isNotEmpty)
                            {
                              return ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.vertical,
                                  itemCount: state.filteredMovies.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        MovieCard(positionNumber: index+1, presentedMovie: state.filteredMovies[index], touchFunction: (){
                                          Navigator.pushNamed(context, SpecificMovieScreen.id, arguments: state.filteredMovies[index]);
                                        },),
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
),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
);
  }
}

