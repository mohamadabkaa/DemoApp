
import 'package:demo_app/pages/home_page.dart';
import 'package:demo_app/pages/nevpages/bar_item_page.dart';
import 'package:demo_app/pages/nevpages/home_page.dart';
import 'package:demo_app/pages/nevpages/my%20page.dart';
import 'package:demo_app/pages/nevpages/search_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}):super(key:key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    Homepage(),
    BarItempage(),
    SearchPage(),
    MyPage()
  ];
  int currentIndex=0;
  void onTap(int inex){
    setState(() {
      currentIndex= inex;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items:[
          BottomNavigationBarItem(label:"Home",icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:"Bar",icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:"Search",icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:"My",icon: Icon(Icons.apps)),
        ]
      ),
    );
  }
}






