<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';
=======
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
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

<<<<<<< HEAD
  UserModel({
=======
  UserModel(
    {
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
    required this.dob,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phoneNum,
    required this.username,
    this.locations = const [],
  });

<<<<<<< HEAD
  Map<String, dynamic> toJson() {
=======
  toJson() {
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
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

<<<<<<< HEAD
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) {
      print('User data is null');
      return UserModel(
        firstName: '',
        lastName: '',
        phoneNum: '',
        email: '',
        dob: '',
        password: '',
        username: '',
      );
    }
    return UserModel(
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      phoneNum: data['phoneNum'] ?? '',
      email: data['email'] ?? '',
      dob: data['dob'] ?? '',
      password: data['password'] ?? '',
      username: data['username'] ?? '',
      locations: (data['locations'] as List<dynamic>? ?? [])
          .map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
=======
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
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
          .toList(),
    );
  }
}
