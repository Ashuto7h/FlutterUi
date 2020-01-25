//SliverAppBar with Search bar at bottom.
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CollapseBar(context),
        ],
      ),
    );
  }

  Widget searchCard() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 6.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Icon(
                  Icons.search,
                  color: Colors.black26,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
        ),
      );

  Widget CollapseBar(BuildContext context) => NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          Container(
            child: SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 3 / 10.6,
              floating: false,
              pinned: true,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(48.0),
                  child: Container(
                    child: searchCard(),
                  )),
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.all(10),
                  collapseMode: CollapseMode.parallax,
                  background: Padding(
                      padding: EdgeInsets.fromLTRB(8, 4, 8, 70),
                      child: Image.asset(
                        '', //todo: your logo
                        fit: BoxFit.contain,
                      ))),
            ),
          )
        ];
      },
      body: Center(
          //  Todo: child: // paste Any card to show on screen,
          ));
}
