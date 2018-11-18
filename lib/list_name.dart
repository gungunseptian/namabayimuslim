import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListName extends StatelessWidget {
  Future<List> getData() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users');
    return json.decode(response.body);
  }

  void doFilter(){

  }
  
  String newValue;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.all(5.0),
              ),
              new DropdownButton<String>(
                hint: new Text("Semua"),
                onChanged: (String changedValue) {
                newValue=changedValue;
              },
              value: newValue,
                items: <String>['Pria', 'Wanita','Semua'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
              ),
              new Padding(
                padding: new EdgeInsets.all(5.0),
              ),
              new DropdownButton<String>(
                hint: new Text("Semua"),
                items:
                    <String>['Islam', 'Kristen', 'Modern','Semua'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              new Padding(
                padding: new EdgeInsets.all(5.0),
              ),
              new RaisedButton(
                child: new Text(
                  "Filter",
                ),
                textColor: Colors.white,
                color: Colors.lightGreen,
                onPressed: doFilter,
              
              ),
              new Padding(
                padding: new EdgeInsets.all(5.0),
              ),
              new RaisedButton(
                child: new Text(
                  "Reset",
                ),
                textColor: Colors.white,
                color: Colors.lightGreen,
                onPressed: doFilter,
              ),
              
            ],
          ),
          new Expanded(
              child: new FutureBuilder<List>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? new ItemList(
                            list: snapshot.data,
                          )
                        : new Center(
                            child: CircularProgressIndicator(),
                          );
                  })),
        ],
      ),
    );
  }
}

class BoxListName extends StatelessWidget {
  BoxListName({this.description, this.title});

  final String description;
  final String title;
  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new ListTile(
            title: new Text(title),
            trailing: new Icon(Icons.favorite),
            subtitle: new Text(description)));
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new BoxListName(
          title: list[i]['username'],
          description: list[i]['name'],
        );
      },
    );
  }
}
