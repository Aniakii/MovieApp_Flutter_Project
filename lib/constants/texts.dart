class Alerts {
  static const String onlineAlertTitle = "NO INTERNET CONNECTION";
  static const String onlineAlertDesc = "It seems that you don't have an internet connection to download movie data. Do you want to try again loading data or show data from yours device memory (offline mode)?";
  static const String tryAgainButton = "TRY AGAIN";
  static const String goOfflineButton = "GO OFFLINE";

  static const String offlineAlertTitle = "NO DATA IN DEVICES MEMORY";
  static const String offlineAlertDesc = "It seems that you haven't used the app yet and there is no data saved on your device. Close the app and open it when you have internet connection.";
  static const String offlineButton = "OK";
  Alerts._();
}

class MovieDesc {
  static const String moviePopularity = 'POPULARITY';
  static const String movieVoteRate = 'VOTE RATE';
  static const String movieReleaseDate = 'RELEASE DATE';
  static const String movieOverview = 'Overview:';

  MovieDesc._();
}

class LoadingTexts {
  static const String loadingText1 = 'Loading data...';
  static const String loadingText2 = 'Wait a moment...';

  LoadingTexts._();
}


class HeaderTexts {
  static const String appName = '🎬 MOVIE FINDER 🎬';
  static const String headerTitle = 'Hello! 👋';
  static const String headerDesc = 'What are we going to watch tonight? 🍿🎬';

  static const String searchHintText = 'Search a movie...';

  HeaderTexts._();
}