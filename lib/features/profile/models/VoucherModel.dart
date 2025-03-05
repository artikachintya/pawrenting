class VoucherModel {
  final String code;
  final String description;
  final int discount;
  final String validUntil; 
  final int minPurchase;

  VoucherModel({
    required this.code, 
    required this.description, 
    required this.discount, 
    required this.validUntil, 
    required this.minPurchase
  });

  toJson() {
    return {
      'code': code, 
      'description': description, 
      'discount': discount, 
      'validUntil': validUntil, 
      'minPurchase': minPurchase
    };
  }

  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    return VoucherModel(
      code: json['code'], 
      description: json['description'], 
      discount: json['discount'], 
      validUntil: json['validUntil'], 
      minPurchase: json['minPurchase']
    );
  }
  

} 