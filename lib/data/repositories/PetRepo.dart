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

  Future<void> createPet(PetModel pet) async {
    print('create pet');
    await _db.collection('pets').add(pet.toJson());
  }

  Future<void> updatePet(String petId, PetModel updatedPet) async {
    print(updatedPet.activities.length);
    print('update pet $petId');
    await _db
        .collection('pets')
        .where('id', isEqualTo: petId)
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.update(updatedPet.toJson());
      }
    });
  }
}
