import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pawrentingreborn/features/home.dart';
import 'package:pawrentingreborn/features/home/screens/home.dart';
import 'package:pawrentingreborn/features/login/landingPage.dart';
import 'package:pawrentingreborn/features/login/login2.dart';
import 'package:pawrentingreborn/features/login/landingPage.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/addPet.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/petAddDiary.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/petdetails.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petDetails/petDiary.dart';
import 'package:pawrentingreborn/features/mypets/screens/petlist/petlist.dart';
import 'package:pawrentingreborn/features/signup/signup.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/theme/theme.dart';
import 'package:pawrentingreborn/features/community/screens/community.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      home: Home(),
    );
  }
}
