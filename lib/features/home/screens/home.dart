import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/features/community/controller/ThreadController.dart';
import 'package:pawrentingreborn/features/community/widget/ThreadCard.dart';
import 'package:pawrentingreborn/features/home/controllers/CartController.dart';
import 'package:pawrentingreborn/features/home/controllers/CategoryController.dart';
import 'package:pawrentingreborn/features/home/controllers/ProductController.dart';
import 'package:pawrentingreborn/features/home/models/product.dart';
import 'package:pawrentingreborn/features/home/models/productModel.dart';
import 'package:pawrentingreborn/features/home/screens/Category/ProductCategory.dart';
import 'package:pawrentingreborn/features/home/screens/Product/ProductDetail.dart';
import 'package:pawrentingreborn/features/home/models/categoryModel.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/classes/catBreeds.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myitems = [
    TImages.banner1,
    TImages.banner2,
    TImages.banner3,
    TImages.banner3,
    TImages.banner3,
  ];

  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {

    CartController cartController = Get.put(CartController());
    ProductController pController = Get.put(ProductController());
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    String? selectedBreed = catBreeds.first;
    CategoryController categoryController = Get.put(CategoryController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => print('monyet')),
      appBar: TAppBar(onMain: true, onPetDetails: false),
      backgroundColor: Color(0xffE7DFF6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            _carouselSlider(),
            SizedBox(height: 30),
            _chooseFeature(),
            SizedBox(height: 30),
            _textPopular(),
            SizedBox(
              height: 20,
            ),
            _popularCategory(),
            SizedBox(height: 20),
            _textProduct(),
            SizedBox(height: 20),
            _product(products: pController.productsList),
          ],
        ),
      ),
    );
  }

  Padding _textProduct() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'PRODUCT',
            style: TextStyle(
                fontFamily: 'AlbertSans',
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Column _popularCategory() {
    CategoryController categoryController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          child: ListView.separated(
              itemCount: categoryController.categoryList.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    categoryController.onSelect(index + 1);
                    Get.to(() => ProductCategory(
                        category: categoryController.categoryList[index]));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.3)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          height: 125,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                                categoryController.categoryList[index].image),
                          ),
                        ),
                        Text(
                          categoryController.categoryList[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Alata-Regular'),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  Padding _textPopular() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'POPULAR CATEGORY',
            style: TextStyle(
                fontFamily: 'AlbertSans',
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Row _chooseFeature() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            Container(
              width: 74,
              height: 71,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 20),
              child: Image.asset(
                TImages.shopIcon,
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 47, left: 45),
              child: Image.asset(
                TImages.discountIcon,
                width: 26,
                height: 26,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 73, left: 7),
              child: Text(
                'SHOPPING',
                style: TextStyle(
                  fontFamily: 'Alata',
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              width: 74,
              height: 71,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 20),
              child: Image.asset(
                TImages.forumIcon,
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 73, left: 17),
              child: Text(
                'FORUM',
                style: TextStyle(
                  fontFamily: 'Alata',
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              width: 74,
              height: 71,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 11, left: 12),
              child: Image.asset(
                TImages.translatePetIcon,
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 73),
              child: Text(
                'TRANSLATE PET',
                style: TextStyle(
                  fontFamily: 'Alata',
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              width: 74,
              height: 71,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 18),
              child: Image.asset(
                TImages.petIdIcon,
                width: 37,
                height: 37,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 73, left: 20),
              child: Text(
                'PET ID',
                style: TextStyle(
                  fontFamily: 'Alata',
                  fontSize: 12,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Column _carouselSlider() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              height: 200,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              pauseAutoPlayOnTouch: true,
              pauseAutoPlayOnManualNavigate: true),
          items: myitems.map((item) => Image.asset(item)).toList(),
        ),
        AnimatedSmoothIndicator(
            activeIndex: myCurrentIndex,
            count: myitems.length,
            effect: const WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 5,
                dotColor: Color(0xff9B9BA0),
                activeDotColor: Color(0xff4749AE),
                paintStyle: PaintingStyle.fill)),
      ],
    );
  }
}

class _product extends StatelessWidget {
  const _product({
    required this.products,
  });

  final RxList<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              onTap: () =>
                  Get.to(() => ProductDetail(product: products[index])),
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
                                products[index].image,
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
                              "${products[index].discount.toStringAsFixed(0)}% OFF",
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
                            'Rp${products[index].price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 12),
                          ),
                          Text(
                            'Rp${products[index].salePrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
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
