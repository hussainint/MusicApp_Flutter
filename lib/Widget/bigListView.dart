import 'package:flutter/material.dart';
import 'package:musicapp/Models/data.dart';
import 'package:musicapp/Models/dataModel.dart';
import 'package:musicapp/Screens/SongList.dart';
import 'package:provider/provider.dart';

class BigListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    List<DataModel> list = Provider.of<Data>(context, listen: false).getData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  Recommended for you',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: height * 0.3,
          // color: Colors.blue,
          child: ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SongList(
                              album: list[i],
                            )),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 8, right: 10, bottom: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          '${list[i].movieCover}',
                          fit: BoxFit.fill,
                          width: height * 0.25,
                          height: height * 0.25,
                        ),
                      ),
                      Text(
                        '${list[i].movieName}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
