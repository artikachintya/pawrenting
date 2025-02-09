import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/features/home/screens/category_model.dart';
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
  List<CategoryModel> categories = CategoryModel.getcategories();

  final myitems = [
    TImages.banner1,
    TImages.banner2,
    TImages.banner3,
    TImages.banner4,
    TImages.banner5
  ];

  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    String? selectedBreed = catBreeds.first;
    return Scaffold(
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
            Column(
              children: [
                Row(
                  
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemBuilder: (context, index) {
                return Container(
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
                          child: Image.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: 'Alata-Regular'),
                      )
                    ],
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
