import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/AuthenticationRepo.dart';
import 'package:pawrentingreborn/data/services/AuthenticationService.dart';
import 'package:pawrentingreborn/features/authentication/model/UserModel.dart';

class SignUpController extends GetxController {
  final _authService = AuthenticationService.instance;

  Future<void> signUp(String email, String password, String firstName,
      String lastName, String phoneNum, String dob, String username) async {
    try {
      print('signup controller');
      await _authService.signUp(
          firstName,
        lastName,
        email,
        password,
        phoneNum,
        username,
        dob,
      );
      // Handle successful sign up, e.g., navigate to another page or show a success message
    } catch (e) {
      // Handle sign up error, e.g., show an error message
      print('Sign up failed: $e');
    }
  }
}
