import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/home/models/product.dart';
import 'package:pawrentingreborn/features/home/screens/Product/ProductDetail.dart';
import 'package:pawrentingreborn/features/home/models/category_model.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class ProductCategory extends StatelessWidget {
  final String category;
  const ProductCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = CategoryModel.getcategories();
    List<Product> products = Product.getProduct();
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
        backgroundColor: TColors.primary,
        appBar: TAppBar(onMain: true, onPetDetails: false),
        bottomNavigationBar:
            InsideNavBar(controller: controller, navcontroller: navcontroller),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: ImageIcon(
                              AssetImage(TImages.arrowBackIcon),
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          Text(
                            category,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      _product(products: products),
                    ]))));
  }
}

class _product extends StatelessWidget {
  const _product({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 13,
              childAspectRatio: 0.77),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.to(() => ProductDetail(
                  image: products[index].Image, name: products[index].name)),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          child: Container(
                            width: 170,
                            height: 130,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Image.asset(
                                products[index].Image,
                                width: products[index].width,
                                height: products[index].height,
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 170,
                          child: Container(
                            width: 10,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomLeft: Radius.circular(50)),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 114,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "${products[index].discount}% OFF",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                fontFamily: 'AlbertSans'),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Rp ${products[index].price.toString().replaceAllMapped(
                                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  (Match m) => "${m[1]}.",
                                )}",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 12),
                          ),
                          Text(
                            "Rp ${products[index].discountedPrice.toString().replaceAllMapped(
                                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  (Match m) => "${m[1]}.",
                                )}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
