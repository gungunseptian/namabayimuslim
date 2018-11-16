import 'package:flutter/material.dart';

class ListName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new BoxListName(
            description: "Lorem Ipsum doler si amet Lorem Ipsum doler si amet", title: "Gavin"),
        new BoxListName(
            description: "Lorem Ipsum doler si amet", title: "Arditian"),
        new BoxListName(
            description: "Lorem Ipsum doler si amet", title: "Mannaf"),
      ],
    );
  }
}

class BoxListName extends StatelessWidget {
  BoxListName({this.description, this.title});

  final String description;
  final String title;
  @override
  Widget build(BuildContext context) {


    double c_width = MediaQuery.of(context).size.width*0.8;

    return new Card(
        child: new Container(
            width: c_width,
            padding: new EdgeInsets.all(5.0),
            child: new Row(
              children: <Widget>[
              new Text(title,
                  style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              new Text(" artinya ", style: new TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic)),
              new Text(description, style: new TextStyle(fontSize: 18.0)),
              new Padding(padding: new EdgeInsets.all(5.0),),
              new Icon(Icons.favorite, color: Colors.grey)
            ],
          )));
  }
}
