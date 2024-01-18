import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomTabBar extends StatelessWidget {
  const CustomBottomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.house,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.tags,
          ),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.heart,
          ),
          label: 'Favorites',
        ),
      ],
    );
  }
}
