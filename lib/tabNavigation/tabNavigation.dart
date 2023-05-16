import 'package:flutter/material.dart';
import 'package:flutter_ctrip/pages/HomePage.dart';
import 'package:flutter_ctrip/pages/PhotoPage.dart';
import 'package:flutter_ctrip/pages/UserCenter.dart';

class TabNavigation extends StatefulWidget{
  const TabNavigation({super.key});

  @override
  State<TabNavigation> createState() {
    // TODO: implement createState
    return _TabNavigationState();
  }
}

class _TabNavigationState extends State<TabNavigation>{
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items:  const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.camera),label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.more),label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "home")
        ],
        selectedItemColor:Colors.blue ,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [
          HomePage(),
          PhotoPage(),
          PhotoPage(),
          UserCenterPage(),
        ],
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  void _onPageChanged(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}