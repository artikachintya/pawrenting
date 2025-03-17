import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/AuthenticationRepo.dart';
import 'package:pawrentingreborn/features/authentication/model/UserModel.dart';

class AuthenticationService extends GetxController {
  static AuthenticationService get instance => Get.find();

  final _authRepo = AuthenticationRepo.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
    String phone,
    String username,
    String dob,
  ) async {
    print('signup service');
    final user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (user != null) {
      final newUser = UserModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNum: phone,
        username: username,
        dob: dob,
        pawpay: 10000000.0,
        password: password,
        locations: [],
      );
      await _authRepo.createUser(newUser);
    }
  }
}
