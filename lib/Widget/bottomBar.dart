import 'package:flutter/material.dart';
import 'package:musicapp/Screens/SongList.dart';
import 'package:musicapp/Screens/playMusic.dart';

class BottomBar extends StatefulWidget {
  int page;
  BottomBar({this.page});
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        margin: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 12),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              iconSize: 27.0,
              icon: Icon(
                Icons.music_note,
              ),
            ),
            IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (BuildContext context) => SongList()),
                // );
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (BuildContext context) => ReportDashboard()),
                // );
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.turned_in_not_rounded,
              ),
            ),
            IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (BuildContext context) => ReportDashboard()),
                // );
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.settings,
              ),
            ),
            //to add a space between the FAB and
          ],
        ),
      ),
      //color of the BottomAppBar
      color: Colors.transparent,
    );
  }
}
