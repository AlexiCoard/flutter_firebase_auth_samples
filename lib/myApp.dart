import 'package:flutter/material.dart';

import 'loginPage.dart';

import 'main.dart' as main;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      routes: <String, WidgetBuilder> {
        "login" : (BuildContext context) => new LoginPage(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    if (!main.isLoggedIn) {
      return new LoginPage();
    }
    else {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text("Home Page"),
            centerTitle: true,
          ),
          //You can use this variable to get informations about the connected user.
          //For example, check the values uid, displayName or photoUrl
          body: new Text("Welcome ${main.connectedUser}")
      );
    }
  }
}
