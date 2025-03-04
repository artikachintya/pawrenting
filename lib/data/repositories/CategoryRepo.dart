import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/models/categoryModel.dart';

class CategoryRepo extends GetxController {
  static CategoryRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;


    Future<List<CategoryModel>> fetchCategory() async {
    final snapshot = await _db.collection('Categories').get();
    // print("Fetched ${snapshot.docs.length} Categories"); // Debugging
    return snapshot.docs.map((e) {
      // print("Category Data: ${e.data()}"); // Debugging
      return CategoryModel.fromSnapshot(e);
    }).toList();
  }
}
