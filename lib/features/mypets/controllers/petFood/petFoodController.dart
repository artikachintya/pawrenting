import 'package:get/get.dart';

class PetFoodController extends GetxController {
  var foodList = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFoodList();
  }

  void fetchFoodList() async {
    isLoading(true);
    try {
      // Simulate a network request
      await Future.delayed(Duration(seconds: 2));
      foodList.value = ['Dog Food', 'Cat Food', 'Bird Food'];
    } finally {
      isLoading(false);
    }
  }

  void addFood(String food) {
    foodList.add(food);
  }

  void removeFood(String food) {
    foodList.remove(food);
  }
}