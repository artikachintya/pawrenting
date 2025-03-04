class VaccineModel {
  final DateTime date;
  final String name;
  final String type;
  final String status;

  VaccineModel({
    required this.date,
    required this.name,
    required this.type,
    required this.status,
  });

  factory VaccineModel.fromJson(Map<String, dynamic> json) {
    return VaccineModel(
      date: DateTime.parse(json['date']),
      name: json['name'],
      type: json['type'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'name': name,
      'type': type,
      'status': status,
    };
  }

  static List<VaccineModel> getCatVaccineList() {
    List<VaccineModel> catVaccineList = [];
    catVaccineList.add(VaccineModel(
        date: DateTime.now(),
        name: 'Rabies Virus',
        type: 'Core',
        status: 'Not Taken'));
    catVaccineList.add(VaccineModel(
        date: DateTime.now(),
        name: 'Feline Panleukopenia (FPV)',
        type: 'Core',
        status: 'Not Taken'));
    catVaccineList.add(VaccineModel(
        date: DateTime.now(),
        name: 'Feline Calicivirus (FCV)',
        type: 'Core',
        status: 'Not Taken'));
    catVaccineList.add(VaccineModel(
        date: DateTime.now(),
        name: 'Feline Leukemia Virus (FeLV)',
        type: 'Non-Core',
        status: 'Not Taken'));
    catVaccineList.add(VaccineModel(
        date: DateTime.now(),
        name: 'Chlamydophila felis',
        type: 'Non-Core',
        status: 'Not Taken'));
    catVaccineList.add(VaccineModel(
        date: DateTime.now(),
        name: 'Bordetella bronchiseptica',
        type: 'Non-Core',
        status: 'Not Taken'));
    return catVaccineList;
  }

  static List<VaccineModel> getDogVaccineList() {
    List<VaccineModel> dogVaccineList = [];
    dogVaccineList.add(VaccineModel(
        date: DateTime.now(),
        name: 'Rabies Virus',
        type: 'Core',
        status: 'Not Taken'));
    dogVaccineList.add(VaccineModel(
        date: DateTime.now(),
        name: 'Canine Distemper Virus (CDV)',
        type: 'Core',
        status: 'Not Taken'));
    dogVaccineList.add(VaccineModel(
        date: DateTime.now(),
        name: 'Canine Parvovirus (CPV-2)',
        type: 'Core',
        status: 'Not Taken'));
    dogVaccineList.add(VaccineModel(
        date: DateTime.now(),
        name: 'Bordetella bronchiseptica',
        type: 'Non-Core',
        status: 'Not Taken'));
    dogVaccineList.add(VaccineModel(
        date: DateTime.now(),
        name: 'Leptospira spp.',
        type: 'Non-Core',
        status: 'Not Taken'));
    dogVaccineList.add(VaccineModel(
        date: DateTime.now(),
        name: 'Canine Influenza Virus (CIV)',
        type: 'Non-Core',
        status: 'Not Taken'));
    return dogVaccineList;
  }
}
