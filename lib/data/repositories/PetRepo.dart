import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/models/petModel.dart';

class PetRepo extends GetxController{
  static PetRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  addPet(PetModel pet){
    print('add pet');
    _db.collection('Pets').add(pet.toJson());
  }

  Future<List<PetModel>> getPets() async {
    final snapshot = await _db.collection('Pets').get();
    print("Fetched ${snapshot.docs.length} pets"); // Debugging
    return snapshot.docs.map((e) {
      print("Pet Data: ${e.data()}"); // Debugging
      return PetModel.fromSnapshot(e);
    }).toList();
  }
}