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

  factory UserModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return UserModel(
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
      phoneNum: snapshot['phoneNum'],
      email: snapshot['email'],
      dob: snapshot['dob'],
      password: snapshot['password'],
      username: snapshot['username'],
      locations: (snapshot['locations'] as List)
          .map((location) => LocationModel.fromJson(location))
          .toList(),
    );
  }
}
