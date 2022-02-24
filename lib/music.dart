import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Music extends StatelessWidget {
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  @override
  play() async {
    int result = await audioPlayer.play(
        'https://assets.mixkit.co/music/preview/mixkit-hip-hop-02-738.mp3');
    print(result);
    if (result == 1) {
      // success
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 100,
        ),
        FlatButton(
          onPressed: play,
          child: Text('YOo'),
        ),
        FlatButton(
          onPressed: () async {
            int result = await audioPlayer.stop();
            print(result);
          },
          child: Text('YO'),
        ),
      ],
    ));
  }
}
