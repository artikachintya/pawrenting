import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String phoneNum;
  final String email;
  final String dob;
  final String password;
  final String username;
  final List<LocationModel> locations;

  UserModel(
    {
    required this.dob,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phoneNum,
    required this.username,
    this.locations = const [],
  });

  toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNum': phoneNum,
      'email': email,
      'dob': dob,
      'password': password,
      'username': username,
      'locations': locations.map((e) => e.toJson()).toList(),
    };
  }
}
