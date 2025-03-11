import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pawrentingreborn/data/repositories/PetRepo.dart';
import 'package:pawrentingreborn/features/mypets/controllers/PetController.dart';
import 'package:pawrentingreborn/features/mypets/models/DiaryModel.dart';

class DiaryController extends GetxController {
  static DiaryController get instance => Get.find();
  RxList<DiaryModel> diaryList = <DiaryModel>[].obs;
  PetController petController = Get.find();
  final petRepo = PetRepo.instance;

  void initDiary(String petId) {
    diaryList.clear();
    diaryList.assignAll(petController.petList.where((pet)=>pet.id == petId).first.diaries);
  }
}
