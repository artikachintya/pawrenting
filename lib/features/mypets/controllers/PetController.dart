import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/PetRepo.dart';
import 'package:pawrentingreborn/features/mypets/models/PetModel.dart';

class PetController extends GetxController {
  static PetController get instance => Get.find();
  final petRepo = PetRepo.instance;
  final _auth = FirebaseAuth.instance;
  final List<PetModel> petList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    fetchUserPets();
    super.onInit();
  }

  void fetchUserPets() async {
    final pets = await petRepo.getPetsForUser(_auth.currentUser!.uid);
    petList.assignAll(pets);
  }
}
