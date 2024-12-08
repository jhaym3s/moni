import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moniepoints_challenge/features/home/screens/home_screen.dart';
import 'package:moniepoints_challenge/features/search%20/screens/search_screens.dart';

import 'widget/bottom_nav.dart';


class CustomNavigationBarScreen extends StatefulWidget {
  const CustomNavigationBarScreen({super.key});

  @override
  State<CustomNavigationBarScreen> createState() => _CustomNavigationBarScreenState();
}
class _CustomNavigationBarScreenState extends State<CustomNavigationBarScreen> {
  late PageController _controller;
   final int _activeIndex =  0 ;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _activeIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
   
   List<IconData> bottomNavIcons = [
    CupertinoIcons.search,
    CupertinoIcons.chat_bubble_2,
    CupertinoIcons.home,
    CupertinoIcons.heart_fill,
    CupertinoIcons.person,
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              children: List.generate(bottomNavIcons.length, (index){
                  return activeScreen(index);
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: BottomNav(
              bottomNavIcons: bottomNavIcons,
              activeIndex: _activeIndex, 
              onTap: () { },
                  ),
            )
          ],
        ),
      ),
    );
  }

  Widget activeScreen(int activeIndex){
      switch (activeIndex) {
        case 0:
          return const SearchScreen();
        case 2:
          return const HomeScreen();
        default:
        return const HomeScreen();
      }
  }
}
