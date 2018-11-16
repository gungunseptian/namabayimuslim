import 'package:flutter/material.dart';

class Favorite extends StatelessWidget  {
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Center(
        child: new Column(
          children:<Widget>[
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Text("Favorite", style: TextStyle(fontSize: 30.0),),
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Icon(Icons.favorite, size: 90.0,)
          ],
        )
      )
    );
  }
}