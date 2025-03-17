import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/ProductRepository.dart';
import 'package:pawrentingreborn/features/home/models/productModel.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class ProductController extends GetxController {
  final productRepo = ProductRepo.instance;
  RxList<ProductModel> productsList = <ProductModel>[].obs;
  RxList<ProductModel> searchResult = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProduct();
    ever(productsList, (_) {
      for (var product in productsList) {
        print(product.name);
      }
    });
    super.onInit();
    
  }

  RxBool isSearching = false.obs;
   Future<void> searchProduct(String query) async {
    print('Query yang dimasukkan: $query');
    print('Total produk sebelum filter: ${productsList.length}');

    if (query.isEmpty) {
      searchResult.clear(); // Kosongkan hasil pencarian
      isSearching.value = false; // Kembali ke tampilan semua produk
      return;
    } else {
      isSearching.value = true; // Sedang mencari
      searchResult.assignAll(
        productsList.where((product) => 
          product.name.toLowerCase().startsWith(query.toLowerCase())).toList(),
      );

      print('Total hasil pencarian lokal: ${searchResult.length}');
    }
  }
  
  Future<void> fetchProduct() async {
    productsList.clear();
    final products = await productRepo.getProducts();
    productsList.assignAll(products);
  }

  void addProduct(ProductModel product) async {
    await productRepo.createProduct(product);
    productsList.add(product);
  }

  void testAdd() async {
    ProductModel product = ProductModel(
        id: 99,
        name: 'Test Product',
        description: 'This is a test product',
        price: 9.99,
        image: TImages.sofaHewan,
        categoryId: 1,
        salePrice: 250000,
        discount: 20,
        stock: 10);
    await productRepo.createProduct(product);
    productsList.add(product);
  }

  void updateProductStock(int productId, int newStock) async {
    final productIndex =
        productsList.indexWhere((product) => product.id == productId);
    if (productIndex != -1) {
      productsList[productIndex].stock = newStock;
      await productRepo.updateProduct(productsList[productIndex]);
      productsList.refresh();
    }

}
}