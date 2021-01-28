import 'package:VarxVPN/presentation/components/utility/palette.dart';
import 'package:VarxVPN/presentation/screens/account/account_screen.dart';
import 'package:VarxVPN/presentation/screens/home/home_screen.dart';
import 'package:VarxVPN/presentation/screens/settings/setting_screen.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _index = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    AccountScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: IndexedStack(
          index: _index,
          children: _screens,
        ),
      ),
      bottomNavigationBar: FloatingNavbar(
        width: Get.width - 50,
        borderRadius: 30,
        itemBorderRadius: 30,
        iconSize: 20,
        selectedBackgroundColor: Colors.white,
        selectedItemColor: Palette.primaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Palette.primaryColor,
        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,
        items: [
          FloatingNavbarItem(
            icon: CupertinoIcons.house_fill,
            title: 'Home',
          ),
          FloatingNavbarItem(
            icon: CupertinoIcons.person_fill,
            title: 'Account',
          ),
          FloatingNavbarItem(
            icon: CupertinoIcons.gear_alt_fill,
            title: 'Settings',
          ),
        ],
      ),
    );
  }
}
