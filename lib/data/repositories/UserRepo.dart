import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/authentication/model/UserModel.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<UserModel?> fetchUserByEmail(String email) async {
    try {
      if (email.isEmpty) {
        print('Email is empty.');
        return null;
      }

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _db
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        print('User found: ${querySnapshot.docs.first.data()}');
        return UserModel.fromSnapshot(querySnapshot.docs.first);
      } else {
        print('User not found.');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
}
