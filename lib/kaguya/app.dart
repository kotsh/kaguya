import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaguya/kaguya/pages/downloads.dart';
import 'package:kaguya/kaguya/pages/explore.dart';
import 'package:kaguya/kaguya/pages/favorites.dart';
import 'package:kaguya/kaguya/pages/settings.dart';

class KaguyaApp extends StatefulWidget {
  const KaguyaApp({Key key}) : super(key: key);

  @override
  _KaguyaAppState createState() => _KaguyaAppState();
}

class _KaguyaAppState extends State<KaguyaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Kaguya",
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.pink,
          accentColor: Colors.pinkAccent,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.pink,
          accentColor: Colors.pinkAccent,
        ),
        debugShowCheckedModeBanner: false,
        home: KaguyaHome());
  }
}

class KaguyaHome extends StatefulWidget {
  @override
  KaguyaHomeState createState() => KaguyaHomeState();
}

class KaguyaHomeState extends State<KaguyaHome> {
  int _index;
  List<Widget> _widgetOptions = <Widget>[
    ExplorePage(),
    FavoritesPage(),
    DownloadsPage(),
    SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kaguya"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => true, // TODO: Show filter menu
          )
        ],
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to exit'),
        ),
        child: SafeArea(
          child: _widgetOptions.elementAt(_index),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (int _index) {
          setState(() {
            this._index = _index;
          });
        },
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Explore'),
            icon: Icon(Icons.explore),
          ),
          BottomNavigationBarItem(
            title: Text('Favorites'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text('Downloads'),
            icon: Icon(Icons.file_download),
          ),
          BottomNavigationBarItem(
            title: Text('Settings'),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
