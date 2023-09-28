import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constants/color_palette.dart';
import 'package:movie_app/constants/enums.dart';
import 'package:movie_app/data/models/sort_menu_item.dart';
import 'package:movie_app/presentation/screens/all_movies_screen/all_movies_bloc.dart';
import 'package:movie_app/presentation/screens/specific_movie_screen/specific_movie_screen.dart';
import 'package:movie_app/presentation/screens/all_movies_screen/widgets/genre_selector.dart';
import 'package:movie_app/presentation/screens/all_movies_screen/widgets/movie_card.dart';

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
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  List<SortMenuItem> sortMenuItems = [
    SortMenuItem(icon: Icons.sort_by_alpha, description: 'From A to Z', sortType: SortingType.fromAtoZ),
    SortMenuItem(icon: Icons.sort_by_alpha, description: 'From Z to A', sortType: SortingType.fromZtoA),
    SortMenuItem(icon: Icons.star_border, description: 'Worst rate', sortType: SortingType.worstRate),
    SortMenuItem(icon: Icons.star, description: 'Best rate', sortType: SortingType.bestRate),
    SortMenuItem(icon: Icons.expand_less, description: 'Most popular', sortType: SortingType.mostPopular),
    SortMenuItem(icon: Icons.expand_more, description: 'Least popular', sortType: SortingType.leastPopular),
    SortMenuItem(icon: Icons.restart_alt, description: 'Default', sortType: SortingType.mostPopular),
  ];

  List<PopupMenuItem<SortingType>> getPopUpItems() {
    List<PopupMenuItem<SortingType>> preparedWidgets = [];
    for (SortMenuItem sortMenuItem in sortMenuItems) {
      preparedWidgets.add(PopupMenuItem<SortingType>(
        value: sortMenuItem.sortType,
        child: Row(
          children: [
            Icon(sortMenuItem.icon),
            SizedBox(width: 8.0),
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
      backgroundColor: brighterPurple,
      appBar: AppBar(
        title: Text('🎬 MOVIE FINDER 🎬',), automaticallyImplyLeading: false,
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
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Hello! 👋',
                      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 5.0,),
                    Text('What are we watching tonight? 🍿🎬',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 7,
                      blurRadius: 5,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
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
                            decoration: InputDecoration(
                              hintText: 'Search a movie...',
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
                                ),
                            ),
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
                    SizedBox(height: 15.0,),
                    Expanded(
                      flex: 1,
                      child: Container(
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
                    ),
                    SizedBox(height: 15.0,),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.vertical,
                            itemCount: state.filteredMovies.length,
                            itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              MovieCard(positionNumber: index+1, presentedMovie: state.filteredMovies[index], touchFunction: (){
                                // Provider.of<MoviesBrain>(context, listen: false).chosenMovie = state.allMovies[index];
                                Navigator.pushNamed(context, SpecificMovieScreen.id, arguments: state.filteredMovies[index]);
                              },),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1.0,
                                height: 0.0,
                              ),
                            ],
                          );
                        }
                          ),

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

