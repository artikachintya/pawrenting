import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/authentication/model/UserModel.dart';
<<<<<<< HEAD

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
=======
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
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
  }
}
