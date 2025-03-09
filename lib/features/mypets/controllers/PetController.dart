import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/PetRepo.dart';
import 'package:pawrentingreborn/features/mypets/models/PetModel.dart';

class PetController extends GetxController {
  static PetController get instance => Get.find();
  final petRepo = PetRepo.instance;
  final _auth = FirebaseAuth.instance;
  final RxList<PetModel> petList = <PetModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchUserPets();
    super.onInit();
  }

  void fetchUserPets() async {
    petList.clear();
    final pets = await petRepo.getPetsForUser(_auth.currentUser!.uid);
    petList.assignAll(pets);
    for (var pet in pets) {
      print('Pet: ${pet.name}, Activities: ${pet.activities}');
    }
  }

  void updatePet(PetModel updatedPet) async {
    await petRepo.updatePet(updatedPet.id, updatedPet);
  }
}
