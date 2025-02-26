import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pawrentingreborn/data/repositories/AuthenticationRepo.dart';
import 'package:pawrentingreborn/data/repositories/CategoryRepo.dart';
import 'package:pawrentingreborn/data/repositories/ProductRepository.dart';
import 'package:pawrentingreborn/data/services/AuthenticationService.dart';
import 'package:pawrentingreborn/features/authentication/controllers/SignUpController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/controllers/petActivity/petActivityController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/petController.dart';
import 'package:pawrentingreborn/firebase_options.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.lazyPut(() => NavBarController());
  Get.lazyPut(() => PetController());
  Get.lazyPut(() => NavigationController());
  Get.lazyPut(() => SignUpController());
  Get.lazyPut(() => AuthenticationService());
  Get.lazyPut(() => AuthenticationRepo());
  Get.lazyPut(() => ProductRepo());
  Get.lazyPut(() => CategoryRepo());
  await GetStorage.init();
  runApp(const MainApp());
}
