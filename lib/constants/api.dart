
class ApiConstants {

  static const String apiKey = "2ba1f12f9bebf71dcaeedb8e16e1e14f";

  static const String genresURL = "https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en";

  static const String moviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=";

  static const String posterURL = "https://image.tmdb.org/t/p/w500";

  static const int numberOfPages = 10;

  const ApiConstants._();
}
