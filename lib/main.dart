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
import 'package:pawrentingreborn/features/mypets/controllers/addPet/addpetPageController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/profile/controllers/AddLocationController.dart';
import 'package:pawrentingreborn/features/profile/controllers/editDataController.dart';
import 'package:pawrentingreborn/features/profile/controllers/editLocationController.dart';
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
  Get.lazyPut(() => addpetPageController(), fenix: true);
  Get.lazyPut(() => NavBarController(), fenix: true);
  Get.lazyPut(() => PetController(), fenix: true);
  Get.lazyPut(() => SignUpController(), fenix: true);
  Get.lazyPut(() => ProductController(), fenix: true);
  Get.lazyPut(() => CategoryController(), fenix: true);
  Get.lazyPut(() => LocationController(), fenix: true);
  Get.lazyPut(() => DeliveryController(), fenix: true);
  Get.lazyPut(() => PaymentController(), fenix: true);
  Get.lazyPut(() => CartController(), fenix: true);
  Get.lazyPut(() => OrderController(), fenix: true);
  Get.lazyPut(() => AddPetController(), fenix: true);
  Get.lazyPut(() => CommentController(), fenix: true);
  Get.lazyPut(() => ActivityController(), fenix: true);
  Get.lazyPut(() => PetFoodController(), fenix: true);
  Get.lazyPut(() => VaccineController(), fenix: true);
  Get.lazyPut(() => ThreadController(), fenix: true);
  Get.lazyPut(() => AddLocationController(), fenix: true);
  Get.lazyPut(() => EditLocationController(), fenix: true);
  Get.lazyPut(() => EditDataController(), fenix: true);
}

void lazyPutRepositories() {
  Get.lazyPut(() => AuthenticationRepo(), fenix: true);
  Get.lazyPut(() => ProductRepo(), fenix: true);
  Get.lazyPut(() => CategoryRepo(), fenix: true);
  Get.lazyPut(() => ThreadRepo(), fenix: true);
  Get.lazyPut(() => ArticleRepo(), fenix: true);
  Get.lazyPut(() => LocationRepo(), fenix: true);
  Get.lazyPut(() => OrderRepo(), fenix: true);
  Get.lazyPut(() => NotifRepo(), fenix: true);
  Get.lazyPut(() => PetRepo(), fenix: true);
  Get.lazyPut(() => CommentRepo(), fenix: true);
  Get.lazyPut(() => UserRepo(), fenix: true);
  Get.lazyPut(() => VoucherRepo(), fenix: true);
}

void lazyPutServices() {
  Get.lazyPut(() => AuthenticationService(), fenix: true);
}

void initializeDependencies() {
  lazyPutRepositories();
  lazyPutControllers();
  lazyPutServices();
}
