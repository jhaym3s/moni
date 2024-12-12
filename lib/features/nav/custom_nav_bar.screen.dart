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
class _CustomNavigationBarScreenState extends State<CustomNavigationBarScreen>  with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  int _activeIndex =  2 ;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _activeIndex);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), 
      end: Offset.zero,          
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 5000));
      _controller.forward();
      });
    // Start the animation
    
  }
   
   List<IconData> bottomNavIcons = [
    CupertinoIcons.search,
    Icons.message,
    CupertinoIcons.home,
    CupertinoIcons.heart_fill,
    CupertinoIcons.person_solid,
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: List.generate(bottomNavIcons.length, (index){
                return activeScreen(_activeIndex);
            }),
          ),
          SlideTransition(
            position: _slideAnimation,
            child: Padding(
              padding: const  EdgeInsets.only(bottom: 25),
              child: BottomNav(
              bottomNavIcons: bottomNavIcons,
              activeIndex: _activeIndex, 
              onTap: (index) {
                    setState(() {
                      _activeIndex = index;
                    });
                  }),
            ),
          )
        ],
      ),
    );
  }
 @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget activeScreen(int activeIndex){
      switch (activeIndex) {
        case 0:
          return const SearchScreen();
        case 2:
          return const HomeScreen();
        default:
        return const Scaffold(
          body: Center(
              child: Text("Nothing here"),
          ),
        );
      }
  }
}
