import 'package:flutter/material.dart';
import 'package:future/screens/history.dart';
import 'package:future/screens/home.dart';
import 'package:future/screens/profile.dart';

class App extends StatefulWidget {
  const App({ super.key });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Home(),
    History(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 70, bottom: 10),
          child: _pages.elementAt(_selectedIndex),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
