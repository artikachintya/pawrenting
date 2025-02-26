import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/theme/custom_theme/text_theme.dart';

class TAppTheme{
   TAppTheme._();

   static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily:'AlbertSans',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: const Color(0xffF8F8F8),
    textTheme: TTextTheme.lightTextTheme
   );
}