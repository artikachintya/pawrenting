import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/CategoryRepo.dart';
import 'package:pawrentingreborn/data/repositories/ProductRepository.dart';
import 'package:pawrentingreborn/features/home/controllers/ProductController.dart';
import 'package:pawrentingreborn/features/home/models/categoryModel.dart';
import 'package:pawrentingreborn/features/home/models/productModel.dart';

class CategoryController extends GetxController {
  final categoryRepo = CategoryRepo.instance;
  ProductController productController = Get.find();
  RxInt selectedCategory = 0.obs;
  List<CategoryModel> categoryList = [];
  RxList<ProductModel> productsList = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchCategory();

    if (productController.productsList.isNotEmpty) {
      updateProductList();
    } else {
      ever(productController.productsList, (_) => updateProductList());
    }
    super.onInit();
  }

  void updateProductList() {
    productsList.assignAll(productController.productsList
        .where((product) => product.categoryId == selectedCategory.value));
  }

  void onSelect(int index) {
    productsList.clear();
    selectedCategory.value = index;
    updateProductList();
  }

  void fetchCategory() async {
    final categories = await categoryRepo.fetchCategory();
    categoryList.assignAll(categories);
  }


  String getCategoryName(int index) {
    return categoryList[index - 1].name;
  }
}
