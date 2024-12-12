import 'package:flutter/material.dart';
import 'package:moniepoints_challenge/core/config/theme.dart';

class MapMarker extends StatelessWidget {
  const MapMarker({super.key,required this.title,});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.appColors.primary,
          borderRadius: const  BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Text(
          title,
          style: const TextStyle(fontSize: 14),
        )
      ),
    );
  }
}
