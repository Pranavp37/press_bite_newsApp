import 'package:flutter/material.dart';
import 'package:news_app/common/helper/is_dark_mode.dart';
import 'package:news_app/core/theme/app_color.dart';
import 'package:news_app/persentation/account/pages/account_page.dart';
import 'package:news_app/persentation/bookmark/pages/bookmark_page.dart';
import 'package:news_app/persentation/home/pages/home_page.dart';
import 'package:news_app/persentation/search/pages/search_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final List _screens = [
    const HomePage(),
    const SearchPage(),
    const BookmarkPage(),
    const AccountPage(),
  ];
  int _selectedtIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedtIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedtIndex,
          selectedItemColor: context.isDarkMode
              ? AppColors.primaryColor
              : AppColors.primaryColor,
          showUnselectedLabels: true,
          onTap: (value) {
            setState(() {
              _selectedtIndex = value;
            });
          },
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: 'bookmark'),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 14,
                  child: Icon(Icons.person),
                ),
                label: 'account'),
          ]),
    );
  }
}
