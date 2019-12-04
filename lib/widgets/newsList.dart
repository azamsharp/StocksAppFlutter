import 'dart:math';

import 'package:flutter/material.dart';

enum ExpandedState { compact, expanded }

class NewsList extends StatelessWidget {
  
  final _newsImages = ["img1.png","img2.png","img3.png","img4.png"];
  final Function onHeaderTapped;
  ExpandedState expandedState = ExpandedState.compact;

  NewsList({this.onHeaderTapped, this.expandedState});

  double _getHeightForExpandedState(BuildContext context) {
    switch (this.expandedState) {
      case ExpandedState.compact:
        return MediaQuery.of(context).size.height - 100;
      case ExpandedState.expanded:
        return MediaQuery.of(context).size.height - 60;
    }
  }

  String _getRandomImage() {
    final index = Random().nextInt(_newsImages.length - 1);
    return 'images/${_newsImages[index]}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onHeaderTapped,
      child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[900], 
        borderRadius: BorderRadius.circular(16)
      ),
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: _getHeightForExpandedState(context),
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
                  trailing: Image.asset(_getRandomImage()),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
