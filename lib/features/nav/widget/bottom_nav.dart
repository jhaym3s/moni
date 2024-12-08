import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.bottomNavIcons, required this.activeIndex, required this.onTap});
  final List<IconData> bottomNavIcons;
  final int activeIndex;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: const ShapeDecoration(shape: CircleBorder(), color: Colors.black),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(bottomNavIcons.length, (index){
          return GestureDetector(
            onTap: onTap,
            child: NavIcon(
            isActive: activeIndex == index,
            icon: bottomNavIcons[index])
            );
        }),
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  const NavIcon({super.key, required this.isActive, required this.icon});
final bool isActive;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor:
            isActive ? Colors.amber: Colors.black,
        radius: isActive ? 24 : 20,
        child: Icon(
          icon,
          color: Colors.amber,
        ),
      );
  }
}