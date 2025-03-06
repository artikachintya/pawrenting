import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/authentication/model/UserModel.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  createUser(UserModel user){
    print('create user');
    _db.collection('users').doc(_auth.currentUser!.uid).set(user.toJson());
  }
}