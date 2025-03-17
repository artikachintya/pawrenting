class DiaryModel {
  final String content;
  final DateTime time;
  final String image;
  final String title;

  DiaryModel({
    required this.content,
    required this.time,
    required this.image,
    required this.title,
  });

  factory DiaryModel.fromJson(Map<String, dynamic> json) {
    return DiaryModel(
      content: json['content'],
      time: DateTime.parse(json['time']),
      image: json['image'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'time': time.toIso8601String(),
      'image': image,
      'title': title,
    };
  }
}
