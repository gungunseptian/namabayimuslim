import 'package:flutter/material.dart';

class GenerateName extends StatelessWidget  {
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Center(
        child: new Column(
          children:<Widget>[
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Text("Generate", style: TextStyle(fontSize: 30.0),),
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Icon(Icons.crop_free, size: 90.0,)

          ],
        )
      )
    );
  }
}