import 'package:musicapp/Models/MusicModel.dart';

class DataModel {
  String movieName;
  String movieCover;
  List<MusicModel> musics;
  DataModel({this.movieCover, this.movieName, this.musics});
}
