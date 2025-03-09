import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/PetRepo.dart';
import 'package:pawrentingreborn/features/mypets/controllers/PetController.dart';
import 'package:pawrentingreborn/features/mypets/models/VaccineModel.dart';

class VaccineController extends GetxController {
  static VaccineController get instance => Get.find();
  PetController petController = Get.find();
  final petRepo = PetRepo.instance;
  RxList<VaccineModel> petVaccines = <VaccineModel>[].obs;
  RxList<VaccineModel> coreVaccines = <VaccineModel>[].obs;
  RxList<VaccineModel> nonCoreVaccines = <VaccineModel>[].obs;

  void initVaccine(String petId) {
    petVaccines.clear();
    petVaccines.assignAll(
        petController.petList.where((pet) => pet.id == petId).first.vaccines);
    coreVaccines.clear();
    nonCoreVaccines.clear();
    petVaccines.forEach((vaccine) {
      if (vaccine.type == 'Core') {
        coreVaccines.add(vaccine);
      } else {
        nonCoreVaccines.add(vaccine);
      }
    });
  }


  void updateVaccine(String petId, String vacId) {
    petController.petList
        .where((pet) => pet.id == petId)
        .first
        .vaccines
        .where((vac) => vac.id == vacId)
        .first
        .updateStatus();
    petRepo.updatePet(
        petId, petController.petList.where((pet) => pet.id == petId).first);
  }
}
