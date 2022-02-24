import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:musicapp/Models/data.dart';
import 'package:musicapp/Models/dataModel.dart';
import 'package:musicapp/Models/nowPlaying.dart';
import 'package:provider/provider.dart';

class PlayMusic extends StatelessWidget {
  DataModel musicData;
  PlayMusic({this.musicData});

  @override
  Widget build(BuildContext context) {
    bool isPlaying =
        Provider.of<Data>(context, listen: true).getisMusicPlaying();
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    String cover = Provider.of<NowPlaying>(context, listen: true).getCover();
    String title = Provider.of<NowPlaying>(context, listen: true).gettitle();
    String singer = Provider.of<NowPlaying>(context, listen: true).getsinger();
    String url = Provider.of<NowPlaying>(context, listen: true).geturl();
    int index = Provider.of<NowPlaying>(context, listen: true).getIndex();
    String movieName =
        Provider.of<NowPlaying>(context, listen: true).getMovieName();
    String formatTime(int seconds) {
      if (seconds < 60)
        return '00:$seconds';
      else {
        int m = (seconds / 60).toInt();
        int s = (seconds % 60).toInt();
        return '0$m:$s';
      }
    }
    

    return Container(
      height: height,
      margin: EdgeInsets.only(
          left: 2,
          right: 3,
          top: MediaQuery.of(context).padding.top + 8,
          bottom: 3),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20.0,
            sigmaY: 20.0,
          ),
          child: Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: Colors.black26,
                width: 0.5,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top + 20,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.arrow_drop_down_rounded),
                                    Text('Now Playing From'),
                                    Icon(Icons.more_horiz_rounded)
                                  ],
                                ),
                                Text(
                                  '$movieName',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                              padding: EdgeInsets.all(23),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                shadowColor: Colors.white,
                                elevation: 5,
                                color: Colors.white,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.network(
                                    '$cover',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )),
                        ),
                        Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$title',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        '$singer',
                                        style: TextStyle(
                                          color: Colors.white38,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Slider(
                                          min: 0,
                                          max: Provider.of<Data>(context,
                                                  listen: true)
                                              .getduration()
                                              .inSeconds
                                              .toDouble(),
                                          value: Provider.of<Data>(context,
                                                  listen: true)
                                              .getposition()
                                              .inSeconds
                                              .toDouble(),
                                          activeColor: Colors.white,
                                          onChanged: (value) {},
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                '${formatTime(Provider.of<Data>(context, listen: true).getposition().inSeconds.toInt())}'),
                                            // Text(
                                            //     '${Provider.of<Data>(context, listen: true).getposition().inSeconds.toDouble()}'),
                                            Text(
                                                '${formatTime(Provider.of<Data>(context, listen: true).getduration().inSeconds.toInt())}'),
                                          ],
                                        )
                                      ],
                                    )),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                          icon: Icon(Icons.replay_10_sharp),
                                          onPressed: () {
                                            Provider.of<Data>(context,
                                                    listen: false)
                                                .forward(Provider.of<Data>(
                                                            context,
                                                            listen: false)
                                                        .getposition()
                                                        .inMilliseconds
                                                        .toInt() -
                                                    5000);
                                          }),
                                      IconButton(
                                        icon: Icon(Icons.skip_previous_rounded),
                                        onPressed: () {
                                          Provider.of<Data>(context,
                                                  listen: false)
                                              .stop();
                                          Provider.of<NowPlaying>(context,
                                                  listen: false)
                                              .setData(
                                                  musicData.movieCover,
                                                  musicData.musics[index - 1]
                                                      .songName,
                                                  musicData
                                                      .musics[index - 1].singer,
                                                  musicData.musics[index - 1]
                                                      .songUrl,
                                                  musicData.movieName,
                                                  index - 1);
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (!isPlaying)
                                            Provider.of<Data>(context,
                                                    listen: false)
                                                .play(musicData
                                                    .musics[index].songUrl);
                                          else
                                            Provider.of<Data>(context,
                                                    listen: false)
                                                .pause();
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Icon(
                                            !isPlaying
                                                ? Icons.play_arrow
                                                : Icons.pause,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.skip_next_rounded),
                                          onPressed: () {
                                            Provider.of<Data>(context,
                                                    listen: false)
                                                .stop();
                                            Provider.of<NowPlaying>(context,
                                                    listen: false)
                                                .setData(
                                                    musicData.movieCover,
                                                    musicData.musics[index + 1]
                                                        .songName,
                                                    musicData.musics[index + 1]
                                                        .singer,
                                                    musicData.musics[index + 1]
                                                        .songUrl,
                                                    musicData.movieName,
                                                    index + 1);
                                          }),
                                      IconButton(
                                          icon: Icon(Icons.forward_10_rounded),
                                          onPressed: () {
                                            print(Provider.of<Data>(context,
                                                    listen: false)
                                                .getposition()
                                                .inMilliseconds);
                                            Provider.of<Data>(context,
                                                    listen: false)
                                                .forward(Provider.of<Data>(
                                                            context,
                                                            listen: false)
                                                        .getposition()
                                                        .inMilliseconds
                                                        .toInt() +
                                                    5000);
                                          }),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                      Icon(Icons.shuffle),
                                      Icon(
                                        Icons.repeat_one_outlined,
                                      ),
                                      Icon(Icons.playlist_play_rounded),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
