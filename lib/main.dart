import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pawrentingreborn/data/repositories/AuthenticationRepo.dart';
import 'package:pawrentingreborn/data/repositories/CategoryRepo.dart';
import 'package:pawrentingreborn/data/repositories/CommentRepo.dart';
import 'package:pawrentingreborn/data/repositories/PetRepo.dart';
import 'package:pawrentingreborn/data/repositories/LocationRepo.dart';
import 'package:pawrentingreborn/data/repositories/OrderRepo.dart';
import 'package:pawrentingreborn/data/repositories/PetRepo.dart';
import 'package:pawrentingreborn/data/repositories/ProductRepository.dart';
import 'package:pawrentingreborn/data/repositories/VoucherRepo.dart';
import 'package:pawrentingreborn/data/repositories/notifRepo.dart';
import 'package:pawrentingreborn/data/repositories/ThreadRepo.dart';
import 'package:pawrentingreborn/data/repositories/UserRepo.dart';
import 'package:pawrentingreborn/data/repositories/articleRepo.dart';
import 'package:pawrentingreborn/data/services/AuthenticationService.dart';
import 'package:pawrentingreborn/features/authentication/controllers/SignUpController.dart';
import 'package:pawrentingreborn/features/community/controller/ThreadController.dart';
import 'package:pawrentingreborn/features/community/controller/commentController.dart';
import 'package:pawrentingreborn/features/home/controllers/CartController.dart';
import 'package:pawrentingreborn/features/home/controllers/CategoryController.dart';
import 'package:pawrentingreborn/features/home/controllers/DeliveryController.dart';
import 'package:pawrentingreborn/features/home/controllers/LocationController.dart';
import 'package:pawrentingreborn/features/home/controllers/OrderController.dart';
import 'package:pawrentingreborn/features/home/controllers/PaymentController.dart';
import 'package:pawrentingreborn/features/home/controllers/ProductController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/ActivityController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/PetController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/AddPetController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/PetFoodController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/VaccineController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/firebase_options.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initializeDependencies();
  await GetStorage.init();
  runApp(const MainApp());
}

void lazyPutControllers() {
  Get.lazyPut(() => NavBarController());
  Get.lazyPut(() => PetController());
  Get.lazyPut(() => NavigationController());
  Get.lazyPut(() => SignUpController());
  Get.lazyPut(() => ProductController());
  Get.lazyPut(() => CategoryController());
  Get.lazyPut(() => LocationController());
  Get.lazyPut(() => DeliveryController());
  Get.lazyPut(() => PaymentController());
  Get.lazyPut(() => CartController());
  Get.lazyPut(() => OrderController());
  Get.lazyPut(() => AddPetController);
  Get.lazyPut(() => CommentController());
  Get.lazyPut(() => ActivityController());
  Get.lazyPut(() => PetFoodController());
  Get.lazyPut(() => VaccineController());
  Get.lazyPut(() => ThreadController());
}

void lazyPutRepositories() {
  Get.lazyPut(() => AuthenticationRepo());
  Get.lazyPut(() => ProductRepo());
  Get.lazyPut(() => CategoryRepo());
  Get.lazyPut(() => ThreadRepo());
  Get.lazyPut(() => ArticleRepo());
  Get.lazyPut(() => LocationRepo());
  Get.lazyPut(() => OrderRepo());
  Get.lazyPut(() => NotifRepo());
  Get.lazyPut(() => PetRepo());
  Get.lazyPut(() => CommentRepo());
  Get.lazyPut(() => UserRepo());
  Get.lazyPut(() => VoucherRepo());
}

void lazyPutServices() {
  Get.lazyPut(() => AuthenticationService());
}

void initializeDependencies() {
  lazyPutRepositories();
  lazyPutControllers();
  lazyPutServices();
}
