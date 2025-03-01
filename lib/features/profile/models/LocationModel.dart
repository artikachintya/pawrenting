import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  final String label;
  final String receiverName;
  final String phoneNum;
  final String fullAddress;


  LocationModel(
    {
    required this.label,
    required this.receiverName,
    required this.phoneNum,
    required this.fullAddress,
  
  });

  toJson() {
    return {
      'label': label,
      'receiverName': receiverName,
      'phoneNum': phoneNum,
      'fullAddress': fullAddress,
    };
  }

    factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      label: json['label'],
      receiverName: json['receiverName'],
      phoneNum: json['phoneNum'],
      fullAddress: json['fullAddress'],
    );
  }

  factory LocationModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return LocationModel(
      label: data['label'],
      receiverName: data['receiverName'],
      phoneNum: data['phoneNum'],
      fullAddress: data['fullAddress'],
    );
  }
}
