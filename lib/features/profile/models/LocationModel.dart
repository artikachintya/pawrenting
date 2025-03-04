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

    Map<String, dynamic> toMap() {
    return {
      "receiverName": receiverName,
      "fullAddress": fullAddress,
      "phoneNum": phoneNum,
      "label": label,
    };
  }

  @override
  String toString() {
    return "Location(label: $label, receiver: $receiverName, address: $fullAddress, phone: $phoneNum)";
  }
}
