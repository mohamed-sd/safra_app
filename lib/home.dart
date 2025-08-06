import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safra_app/booksNav.dart';
import 'package:safra_app/homeNav.dart';
import 'package:safra_app/profileNav.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final List<Widget> _screens = [
      HomeNav(),
      Booksnav(),
      const Profilenav()
    ];

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body:
          AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            child: _screens[_currentIndex],
          ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("الرئيسية"),
                selectedColor: Colors.blue,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.checklist_rtl_sharp),
                title: Text("الحجوزات"),
                selectedColor: Colors.blue,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("حساب"),
                selectedColor: Colors.blue,
              ),
              // SalomonBottomBarItem(
              //   icon: Icon(Icons.settings),
              //   title: Text("إعدادات"),
              //   selectedColor: Colors.blue,
              // ),
            ],
          ),

        ),
      ),
    );
  }


}
