import 'package:flutter/material.dart';
import 'package:flutter_drawer/component/MainDrawer.dart';

class MyHomePageDetail extends StatefulWidget {
  MyHomePageDetail({Key key, this.title, this.listData}) : super(key: key);

  final String title;
  final String listData;

  @override
  _MyHomePageDetailState createState() => _MyHomePageDetailState();
}

class _MyHomePageDetailState extends State<MyHomePageDetail> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePageDetail object that was created by
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
              widget.listData,
            ),
          ],
        ),
      ),
    );
  }
}
