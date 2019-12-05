import 'dart:math';

import 'package:flutter/material.dart';

enum ExpandedState { compact, expanded }

class NewsList extends StatefulWidget {

  final Function onHeaderTapped;
  final Function(DragUpdateDetails) onPanUpdate; 
  ExpandedState expandedState = ExpandedState.compact;

  NewsList({this.onHeaderTapped, this.expandedState, this.onPanUpdate});

  @override 
  _NewsListState createState() => _NewsListState(); 
}

class _NewsListState extends State<NewsList> {

  final _newsImages = ["img1.png","img2.png","img3.png","img4.png","img1.png","img2.png","img3.png","img4.png","img1.png","img2.png","img3.png","img4.png","img1.png","img2.png","img3.png","img4.png","img1.png","img2.png","img3.png","img4.png","img1.png","img2.png","img3.png","img4.png"];
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: this.widget.onPanUpdate,
      onTap: this.widget.onHeaderTapped,
      child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[900], 
        borderRadius: BorderRadius.circular(16)
      ),
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: 800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Business News",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                Text("From Apple News",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))
              ]),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Wrap(children: <Widget>[
                    Text("THE WALL STREET JOURNAL",
                        style: TextStyle(color: Colors.white)),
                    Text(
                        "Houston weather drops to the record min 20F",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold))
                  ]),
                  trailing: Image.asset("images/${_newsImages[index]}"),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
