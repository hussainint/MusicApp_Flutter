import 'package:flutter/material.dart';
import 'package:musicapp/Models/data.dart';
import 'package:musicapp/Models/nowPlaying.dart';
import 'package:provider/provider.dart';
import 'music.dart';
import 'mainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Data(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => NowPlaying(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          /* dark theme settings */
          primaryColor: Colors.black,
        ),
        home: MainScreen(),
      ),
    );
  }
}
