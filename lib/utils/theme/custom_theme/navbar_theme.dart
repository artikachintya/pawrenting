import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';


class TNavBarTheme{
  TNavBarTheme._();

  static NavigationBarTheme NavBarTheme = NavigationBarTheme(
     data: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.all(
        TextStyle(color: TColors.accent)
     )
     ),
     child: NavigationBar(
      destinations: [
        NavigationDestination(icon: ImageIcon(AssetImage(TImages.homeIcon), color: TColors.accent,), label: 'Home' ),
        NavigationDestination(icon: ImageIcon(AssetImage(TImages.myPetIcon), color: TColors.accent,), label: 'My Pets'),
        SizedBox(width: 100,),
        NavigationDestination(icon: ImageIcon(AssetImage(TImages.communityIcon), color: TColors.accent), label: 'Community'),
        NavigationDestination(icon: ImageIcon(AssetImage(TImages.profileIcon), color: TColors.accent), label: 'Profile'),
      ]
     ),
  );
}