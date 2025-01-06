import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/controllers/petController.dart';
import 'package:pawrentingreborn/firebase_options.dart';
import 'package:pawrentingreborn/utils/theme/theme.dart';
import '';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.lazyPut(()=>NavBarController());
  Get.lazyPut(()=>PetController());
  runApp(const MainApp());
}
