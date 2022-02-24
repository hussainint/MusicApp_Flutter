import 'package:flutter/material.dart';
import 'package:musicapp/Models/MusicModel.dart';
import 'package:musicapp/Models/data.dart';
import 'package:musicapp/Models/dataModel.dart';
import 'package:musicapp/Models/nowPlaying.dart';
import 'package:musicapp/Screens/playMusic.dart';
import 'package:musicapp/Widget/bottomBar.dart';
import 'package:provider/provider.dart';

class SongList extends StatelessWidget {
  DataModel album;
  SongList({@required this.album});
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    List<DataModel> list = Provider.of<Data>(context, listen: false).getData();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // padding: EdgeInsets.only(top: ,
                height: height * 0.40 + 35,
                child: Stack(
                  children: [
                    Image.network(
                      '${album.movieCover}',
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: height * 0.40,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        height: 70,
                        width: 70,
                        child: Icon(Icons.play_arrow),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '   All Songs',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: album.musics.length,
                      itemBuilder: (ctx, i) {
                        return ListTile(
                          onTap: () {
                            // cover: '${album.movieCover}',
                            //       movieName: '${album.movieName}',
                            //       singer: '${album.musics[i].singer}',
                            //       title: '${album.musics[i].songName}',
                            //       url: '${album.musics[i].songUrl}',
                            Provider.of<NowPlaying>(context, listen: false)
                                .setData(
                                    '${album.movieCover}',
                                    '${album.musics[i].songName}',
                                    '${album.musics[i].singer}',
                                    '${album.musics[i].songUrl}',
                                    '${album.movieName}',
                                    i);
                                    //check
                            Provider.of<Data>(context, listen: false)
                                .play(album.musics[i].songUrl);
                                //
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              builder: (context) {
                                return PlayMusic(
                                  musicData: album,
                                );
                              },
                            );
                          },
                          title: Text(
                            '${album.musics[i].songName}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text('${album.musics[i].singer}'),
                          leading: Text(
                            '0${i + 1}',
                            style: TextStyle(color: Colors.red[300]),
                          ),
                          trailing: Icon(Icons.more_vert),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
