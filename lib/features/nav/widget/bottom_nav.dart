import 'package:flutter/material.dart';
import 'package:moniepoints_challenge/core/config/theme.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.bottomNavIcons, required this.activeIndex, required this.onTap});
  final List<IconData> bottomNavIcons;
  final int activeIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const StadiumBorder(),
      color: Colors.black,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(bottomNavIcons.length,(index) {
          return GestureDetector(
            onTap: () {
              onTap.call(index);
            },
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
          backgroundColor:
              isActive ? context.appColors.primary: context.appColors.tertiary,
          radius: isActive ? 24 : 20,
          child: Icon(
            icon,
            color: context.appColors.secondary,
          ),
        ),
    );
  }
}