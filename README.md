# Flutter Drawer with State Management

A new Flutter project demonstrating a pattern for managing state between the drawers in the application and using one widget to represent the drawer across multiple application pages

## Getting Started

- install the Provider Package from https://pub.dev/
- The Provider Package
  - A dependency injection system built with widgets for widgets. provider is mostly syntax sugar for InheritedWidget, to make common use-cases straightforward.
  - [Provider Package Documentation][1]

## Quick Overview of Code

Create a separate widget for the drawer and just use in anywhere you need to.

Manage the Drawer State with a [Provider to Manage State][1]
```dart
class DrawerStateInfo with ChangeNotifier {
  int _currentDrawer = 0;
  int get getCurrentDrawer => _currentDrawer;

  void setCurrentDrawer(int drawer) {
    _currentDrawer = drawer;
    notifyListeners();
  }

  void increment() {
    notifyListeners();
  }
}
```
Adding State Management to the Widget tree
```dart
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider<DrawerStateInfo>(
            builder: (_) => DrawerStateInfo()),
      ],
    );
  }
}
```


Creating The Drawer Widget for reuse in application
```dart
class MyDrawer extends StatelessWidget {
  MyDrawer(this.currentPage);

  final String currentPage;

  @override
  Widget build(BuildContext context) {
    var currentDrawer = Provider.of<DrawerStateInfo>(context).getCurrentDrawer;
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              "Home",
              style: currentDrawer == 0
                  ? TextStyle(fontWeight: FontWeight.bold)
                  : TextStyle(fontWeight: FontWeight.normal),
            ),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              if (this.currentPage == "Home") return;

              Provider.of<DrawerStateInfo>(context).setCurrentDrawer(0);

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      MyHomePage(title: "Home")));
            },
          ),
          ListTile(
            title: Text(
              "About",
              style: currentDrawer == 1
                  ? TextStyle(fontWeight: FontWeight.bold)
                  : TextStyle(fontWeight: FontWeight.normal),
            ),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              if (this.currentPage == "About") return;

              Provider.of<DrawerStateInfo>(context).setCurrentDrawer(1);

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => MyAboutPage()));
            },
          ),
        ],
      ),
    );
  }
}

```

Use of Drawer in one of your pages
```dart
class MyAboutPage extends StatefulWidget {
  @override
  _MyAboutPageState createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      drawer: MyDrawer("About"),
    );
  }
}
```


  [1]: https://pub.dev/packages/provider







A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
