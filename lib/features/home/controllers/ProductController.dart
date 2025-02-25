import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/ProductRepository.dart';
import 'package:pawrentingreborn/features/home/models/productModel.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class ProductController extends GetxController {
  final productRepo = ProductRepo.instance;
  RxList<ProductModel> productsList = <ProductModel>[].obs;

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

  Future<void> fetchProduct() async {
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
}
