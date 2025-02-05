import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
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
  final myitems = [TImages.petCard, TImages.petCard, TImages.petCard];

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
            SizedBox(height: 15),
            Container(
              child: Row(
                children: [
                  
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
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
