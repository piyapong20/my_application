import 'package:flutter/material.dart';
import 'package:my_application/screen/home/home_screen.dart';
import 'package:my_application/screen/home/profile_screen.dart';
import 'package:my_application/screen/home/setting_screen.dart';

class BottomMenu {
  String title;
  IconData icon;
  Widget screen;
  BottomMenu({required this.title, required this.icon, required this.screen});
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedindex = 0;
  List<BottomMenu> bottomMenu = [
    BottomMenu(
      title: 'Home',
      icon: Icons.home,
      screen: const HomeScreen(),
    ),
    BottomMenu(
      title: 'Settings',
      icon: Icons.settings,
      screen: const SettingScreen(),
    ),
    BottomMenu(
      title: 'Profile',
      icon: Icons.person,
      screen: const ProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bottomMenu[selectedindex].title),
      ),
      body: bottomMenu[selectedindex].screen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedindex = value;
          });
        },
        items: bottomMenu
            .map((e) => BottomNavigationBarItem(
                  icon: Icon(e.icon),
                  label: e.title,
                ))
            .toList(),
      ),
    );
  }
}
