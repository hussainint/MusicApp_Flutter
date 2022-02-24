import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:musicapp/Screens/playMusic.dart';
import 'package:musicapp/Widget/bottomBar.dart';
import 'package:musicapp/Widget/smallListview.dart';

import 'Widget/bigListView.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Explore',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.settings),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SmallListView(),
                  SizedBox(
                    height: 20,
                  ),
                  BigListView(),
                  SizedBox(
                    height: 20,
                  ),
                  BigListView(),
                  SizedBox(
                    height: 20,
                  ),
                  BigListView(),
                  SizedBox(
                    height: 20,
                  ),
                  BigListView(),
                  SizedBox(
                    height: 20,
                  ),
                  BigListView(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomBar(),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showModalBottomSheet(
      //       isScrollControlled: true,
      //       context: context,
      //       backgroundColor: Colors.transparent,
      //       barrierColor: Colors.transparent,
      //       builder: (context) {
      //         return PlayMusic();
      //       },
      //     );
      //   },

      //   child: Text('a'),
      // ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}
