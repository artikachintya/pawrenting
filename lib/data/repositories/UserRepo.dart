import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/authentication/model/UserModel.dart';
import 'package:pawrentingreborn/features/home/models/categoryModel.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;


  Future<UserModel?> getCurrentUserData(String email) async {
    try {
      final snapshot = await _db.collection('users').doc(email).get();
      if (snapshot.exists) {
        return UserModel.fromSnapshot(snapshot.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error getting user data: $e');
    }
    return null;
  }
}
