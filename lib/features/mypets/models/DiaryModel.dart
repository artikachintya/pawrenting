class DiaryModel {
  final String content;
  final DateTime date;
  final String image;
  final String title;

  DiaryModel({
    required this.content,
    required this.date,
    required this.image,
    required this.title,
  });

  factory DiaryModel.fromJson(Map<String, dynamic> json) {
    return DiaryModel(
      content: json['content'],
      date: DateTime.parse(json['date']),
      image: json['image'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'date': date.toIso8601String(),
      'image': image,
      'title': title,
    };
  }
}
