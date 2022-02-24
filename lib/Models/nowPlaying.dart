import 'package:flutter/cupertino.dart';

class NowPlaying with ChangeNotifier {
  String cover;
  String title;
  String singer;
  String url;
  String movieName;
  int index;

  String getCover() {
    return cover;
  }

  String gettitle() {
    return title;
  }

  String getsinger() {
    return singer;
  }

  String geturl() {
    return url;
  }

  String getMovieName() {
    return movieName;
  }

  int getIndex() {
    return index;
  }

  void setData(
    String coverr,
    String titlee,
    String singerr,
    String urll,
    String movienamee,
    int indexx,
  ) {
    cover = coverr;
    title = titlee;
    singer = singerr;
    url = urll;
    movieName = movienamee;
    index = indexx;
    notifyListeners();
  }
}
