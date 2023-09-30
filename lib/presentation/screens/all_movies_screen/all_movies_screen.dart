import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constants/color_palette.dart';
import 'package:movie_app/constants/enums.dart';
import 'package:movie_app/data/models/sort_menu_item.dart';
import 'package:movie_app/presentation/screens/all_movies_screen/bloc/all_movies_bloc.dart';
import 'package:movie_app/presentation/widgets/genre_list.dart';

import '../../../constants/others.dart';
import '../../../constants/texts.dart';
import '../../widgets/header.dart';
import '../../widgets/movie_list.dart';

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
  void dispose() {
    _textEditingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String textPattern = '';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.brighterPurple,
      appBar: AppBar(
        title: const Text(AppTexts.appName),
        automaticallyImplyLeading: false,
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
                padding: const EdgeInsets.only(
                  // left: 10.0,
                  // right: 10.0,
                  top: 20.0,
                ),
                decoration: cardDecoration,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
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
                            icon: Icon(
                              Icons.search,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            onPressed: () {
                              context
                                  .read<AllMoviesBloc>()
                                  .add(SearchMovieByPatternEvent(textPattern));
                              FocusScope.of(context).unfocus();
                              _textEditingController.clear();
                            },
                          ),
                          PopupMenuButton<SortingType>(
                            onSelected: (SortingType sortingType) {
                              context
                                  .read<AllMoviesBloc>()
                                  .add(SortMoviesEvent(sortingType));
                              _scrollToTop();
                            },
                            child: Icon(
                              Icons.swap_vert,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            itemBuilder: (BuildContext context) =>
                                getPopUpItems(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Expanded(
                      flex: 1,
                      child: GenreList(_scrollToTop),
                    ),
                    const SizedBox(height: 15.0),
                    Expanded(
                      flex: 4,
                      child: MovieList(_scrollController),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
