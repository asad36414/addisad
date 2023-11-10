import 'package:addisad/admin/screens/add_post.dart';
import 'package:addisad/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AddProductPage(),
    Text('Tab 3', style: TextStyle(fontSize: 30)),
    Text('Tab 5', style: TextStyle(fontSize: 30)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color:
                    _selectedIndex == 0 ? Color(0xFFFE805F) : Colors.black54),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add,
                color:
                    _selectedIndex == 1 ? Color(0xFFFE805F) : Colors.black54),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,
                color:
                    _selectedIndex == 2 ? Color(0xFFFE805F) : Colors.black54),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color:
                    _selectedIndex == 3 ? Color(0xFFFE805F) : Colors.black54),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        selectedItemColor: Color(0xFFFE805F), // Selected item label color
        unselectedItemColor: Colors.black, // Unselected item label color
        iconSize: 28,
        onTap: _onItemTapped,
      ),
    );
  }
}
