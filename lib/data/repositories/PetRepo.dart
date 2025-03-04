import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/models/PetModel.dart';

class PetRepo extends GetxController {
  static PetRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<PetModel>> getPetsForUser(String userId) async {
    final snapshot =
        await _db.collection('pets').where('uid', isEqualTo: userId).get();
    print("Fetched ${snapshot.docs.length} pets for user $userId"); // Debugging
    return snapshot.docs.map((e) {
      print("Pet Data: ${e.data()}"); // Debugging
      return PetModel.fromSnapshot(e);
    }).toList();
  }

  void createPet(PetModel pet) {
    _db.collection('pets').add(pet.toJson());
  }
}
