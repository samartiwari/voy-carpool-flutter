import 'package:flutter/material.dart';
import 'package:voy/pages/profile_screen.dart';

import 'eco_screen.dart';
import 'history_screen.dart';
import 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),  // Fetches API for Home
    HistoryScreen(), // Fetches API for History
    EcoScreen(),  // Fetches API for Eco
    ProfileScreen(), // Fetches API for Profile
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF191919),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        backgroundColor: Color(0XFF252525),
        type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0XFF5D5D5D),
          selectedFontSize: 16,
          unselectedFontSize: 16,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Color(0XFF7E60BF),size: 35),
          unselectedIconTheme: IconThemeData(color: Colors.white,size: 35),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: "History"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.eco),
                label: "Eco"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile"
            ),
          ]
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
}
