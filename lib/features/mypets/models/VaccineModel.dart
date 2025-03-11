class VaccineModel {
  final String id;
  DateTime date;
  final String name;
  final String type;
  String status;

  VaccineModel({
    required this.id,
    required this.date,
    required this.name,
    required this.type,
    required this.status,
  });

  factory VaccineModel.fromJson(Map<String, dynamic> json) {
    return VaccineModel(
      id: json['id'],
      date: DateTime.parse(json['date']),
      name: json['name'],
      type: json['type'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'name': name,
      'type': type,
      'status': status,
    };
  }

  static List<VaccineModel> getCatVaccineList() {
    List<VaccineModel> catVaccineList = [];
    catVaccineList.add(VaccineModel(
        id: '1',
        date: DateTime.now(),
        name: 'Rabies Virus',
        type: 'Core',
        status: 'Not Taken'));
    catVaccineList.add(VaccineModel(
        id: '2',
        date: DateTime.now(),
        name: 'Feline Panleukopenia (FPV)',
        type: 'Core',
        status: 'Not Taken'));
    catVaccineList.add(VaccineModel(
        id: '3',
        date: DateTime.now(),
        name: 'Feline Calicivirus (FCV)',
        type: 'Core',
        status: 'Not Taken'));
    catVaccineList.add(VaccineModel(
        id: '4',
        date: DateTime.now(),
        name: 'Feline Leukemia Virus (FeLV)',
        type: 'Non-Core',
        status: 'Not Taken'));
    catVaccineList.add(VaccineModel(
        id: '5',
        date: DateTime.now(),
        name: 'Chlamydophila felis',
        type: 'Non-Core',
        status: 'Not Taken'));
    catVaccineList.add(VaccineModel(
        id: '6',
        date: DateTime.now(),
        name: 'Bordetella bronchiseptica',
        type: 'Non-Core',
        status: 'Not Taken'));
    return catVaccineList;
  }

  static List<VaccineModel> getDogVaccineList() {
    List<VaccineModel> dogVaccineList = [];
    dogVaccineList.add(VaccineModel(
        id: '1',
        date: DateTime.now(),
        name: 'Rabies Virus',
        type: 'Core',
        status: 'Not Taken'));
    dogVaccineList.add(VaccineModel(
        id: '2',
        date: DateTime.now(),
        name: 'Canine Distemper Virus (CDV)',
        type: 'Core',
        status: 'Not Taken'));
    dogVaccineList.add(VaccineModel(
        id: '3',
        date: DateTime.now(),
        name: 'Canine Parvovirus (CPV-2)',
        type: 'Core',
        status: 'Not Taken'));
    dogVaccineList.add(VaccineModel(
        id: '4',
        date: DateTime.now(),
        name: 'Bordetella bronchiseptica',
        type: 'Non-Core',
        status: 'Not Taken'));
    dogVaccineList.add(VaccineModel(
        id: '5',
        date: DateTime.now(),
        name: 'Leptospira spp.',
        type: 'Non-Core',
        status: 'Not Taken'));
    dogVaccineList.add(VaccineModel(
        id: '6',
        date: DateTime.now(),
        name: 'Canine Influenza Virus (CIV)',
        type: 'Non-Core',
        status: 'Not Taken'));
    return dogVaccineList;
  }

  void updateStatus() {
    String newStatus;
    if (status == 'Taken') {
      newStatus = 'Not Taken';
    } else {
      newStatus = 'Taken';
    }
    status = newStatus;
    date = DateTime.now();
  }
}
