import 'package:flutter/material.dart';
import 'package:flutter_drawer/component/AList.dart';
import 'package:flutter_drawer/component/GMap.dart';
import 'package:flutter_drawer/component/MainDrawer.dart';
import 'package:flutter_drawer/pages/MyHomePageDetail.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              AList(),
              RaisedButton(
                child: Text('Next Page'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MyHomePageDetail(title: "Detail Page")));
                },
              ),
            ],
          ),
        ),
        drawer: MyDrawer("Home"));
  }
}
