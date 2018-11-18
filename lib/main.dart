import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import './list_name.dart' as list_name;
import './generate_name.dart' as generate_name;
import './favorite.dart' as favorite;

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new Home(),
        title: new Text(
          '1001 Nama Bayi Muslim',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.white,
            //fontFamily: "MaterialIcons",
          ),
        ),
        image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Colors.lightGreen,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red);
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        ////// APP BAR VERSION 2
        // appBar: new AppBar(
        //   backgroundColor: Colors.lightGreen,
        //   leading: IconButton(
        //     icon: Icon(
        //       Icons.menu,
        //       semanticLabel: 'menu',
        //     ),
        //     onPressed: () {
        //       print('Menu button');
        //     },
        //   ),
        //   title: new Text("1001 Nama Bayi"),
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(
        //         Icons.search,
        //         semanticLabel: 'search',
        //       ),
        //       onPressed: () {
        //         print('Search button');
        //       },
        //     ),
        //     IconButton(
        //       icon: Icon(
        //         Icons.tune,
        //         semanticLabel: 'filter',
        //       ),
        //       onPressed: () {
        //         print('Filter button');
        //       },
        //     ),
        //   ],
        // ),

        ////// APP BAR VERSION 1
        appBar: new AppBar(

          title: new Center(
            child:new Text("1001 Nama Bayi Muslim")
            ),
          bottom: new TabBar(
            controller: controller,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.list), text: "Daftar Nama",),
              new Tab(icon: new Icon(Icons.lightbulb_outline), text:"Ide Nama"),
              new Tab(icon: new Icon(Icons.favorite), text: "Favorit",),
            ],
          ),
          backgroundColor: Colors.lightGreen,
        ),

        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new list_name.ListName(),
            new generate_name.GenerateName(),
            new favorite.Favorite()
          ],
        ));
  }
}
