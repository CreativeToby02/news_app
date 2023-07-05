import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      // currentIndex: _currentIndex,
      // onTap: (i) => setState(() => _currentIndex = i),
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          selectedColor: Colors.blue,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text("Discover"),
          selectedColor: Colors.blue,
        ),

        /// Search
        SalomonBottomBarItem(
          icon: Icon(Icons.bookmark_border_outlined),
          title: Text("Search"),
          selectedColor: Colors.blue,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: Icon(Icons.person_3_outlined),
          title: Text("Profile"),
          selectedColor: Colors.blue,
        ),
      ],
    );
  }
}
