import 'package:flutter/material.dart';
import 'package:flutter_drawer/component/ASimpleList.dart';
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
            actions: <Widget>[
              new IconButton(
                icon: Icon(Icons.update),
                tooltip: 'Change Color',
                onPressed: () {
                  _showDialog("Action Button Pressed");
                },
              )
            ]),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(
              //   'You have pushed the button this many times:',
              // ),
              ASimpleList(),
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

  // user defined function
  void _showDialog(_text) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: new Text("List Item Clicked"),
            content: new Text(_text),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
    );
  }
}
