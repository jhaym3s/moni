import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


// typedef ToolbarOptionModelCallback = void Function(ToolbarOptionModel sortModel);

const String kCompanyName = 'Moniepoint';
const String kAppVersion = '1.0.0';

// Date/time formats
const String kDateFormat = 'dd/MM/yyyy';
const String kDateTimeFormat = 'dd/MM/yyyy HH:mm';
const String kTimeFormat = 'HH:mm';

const  String currencySymbol = "₦";
const  String customAmount = "₦300,000";

//! Various Sizes
double kBottomBarIconSize = 32;
const double kBoxDecorationRadius = 8.0;
const double kFormFieldsRadius = 6.0;
const double kRoundedButtonRadius = 24.0;
const double kCardRadius = 24.0;
const double kBadgeRadius = 16.0;
const double kTimelineDateSize = 88.0;
const double kBorderRadius = 10.0;
const double kBottomNavBarHeight = 60.0;

//! Colors
const Color kPrimaryColor = Color(0xffF000000);
const Color lightScaffoldBackgroundColor = Color(0xffFFFDF7);
const Color kTextColorsLight = Color(0xFF100C08);
const Color navBarIconsInActiveColor = Color(0xff98A2B3);
const Color kWhite = Color(0xFFFFFFFF);
const Color kBlack = Color(0xFF000000);
const Color kError = Color(0xFFF04438);
const Color kGrey = Color(0xff5B6C7C);
const Color kWarning = Color(0xfff79009);
const Color kTransparent = Colors.transparent;
const Color kSuccess = Color(0xFF12B76A);

double kScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double kScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}







