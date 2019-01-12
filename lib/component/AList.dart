import 'package:flutter/material.dart';

///
/// simple list clas for rendering a list with basic
/// list items
///
class AList extends StatefulWidget {
  @override
  _AListState createState() => new _AListState();
}

class _AListState extends State<AList> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // tell tell the list to expand to fill rest of space
    return Expanded(
      // build the list
      child: new ListView.builder(
          padding: const EdgeInsets.all(10.0),
          // Let the ListView know how many items it needs to build
          itemCount: items.length,
          // build the list
          itemBuilder: (BuildContext _context, int index) {
            final item = items[index];
            return _buildRow(item);
          }),
    );
  }

  Widget _buildRow(String pair) {
    return new ListTile(
      onTap: () {
        _showDialog(pair);
      },
      title: new Text(
        pair,
        style: _biggerFont,
      ),
    );
  }

  final items = new List<String>.generate(
      20, (int index) => 'List Item ' + '$index'); // [0, 1, 4]

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
