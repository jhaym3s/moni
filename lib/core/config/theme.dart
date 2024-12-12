import 'package:flutter/material.dart';


final ColorScheme colorScheme = const  ColorScheme.light().copyWith(
  primary: const Color(0xffffaf42),
  secondary: const Color(0xffffffff), 
  tertiary: const Color(0xff000000), 
  onPrimary: Colors.brown.shade300,
   shadow:  Colors.white38,
  );

 extension VBankAppExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get appColors => colorScheme;
  double deviceHeight() => MediaQuery.of(this).size.height;
  double deviceWidth() => MediaQuery.of(this).size.width;
}