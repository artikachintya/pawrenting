class UserModel {
  final String firstName;
  final String lastName;
  final String phoneNum;
  final String email;
  final String dob;
  final String password;
  final String username;

  UserModel(
    {
    required this.dob,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phoneNum,
    required this.username,
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
    };
  }
}
