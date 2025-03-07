class FoodModel {
  final String food;
  final DateTime date;
  final double amount;

  FoodModel({required this.food, required this.date, required this.amount});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      food: json['food'],
      date: DateTime.parse(json['date']),
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'food': food,
      'date': date.toIso8601String(),
      'amount': amount,
    };
  }
}
