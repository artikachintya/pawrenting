class ActivityModel {
  final DateTime date;
  final String location;
  final String title;
  final String type;

  ActivityModel({
    required this.date,
    required this.location,
    required this.title,
    required this.type,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      date: DateTime.parse(json['date']),
      location: json['location'],
      title: json['title'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'location': location,
      'title': title,
      'type': type,
    };
  }
}
