import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/community/controller/ArticleController.dart';
import 'package:pawrentingreborn/features/community/screens/article.dart';
import 'package:pawrentingreborn/features/community/screens/catArticle.dart';
import 'package:pawrentingreborn/features/community/screens/viewMoreArticle.dart';
import 'package:pawrentingreborn/features/community/widget/articleHome.dart';
import 'package:pawrentingreborn/features/community/widget/optionArticleThread.dart';
import 'package:pawrentingreborn/features/community/widget/searchbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class dogArticle extends StatefulWidget {
  const dogArticle({super.key});

  @override
  State<dogArticle> createState() => _dogArticle();
}

TextEditingController searchController = TextEditingController();

class _dogArticle extends State<dogArticle> {
  int myCurrentIndex = 0;
  final myitems = [
    TImages.articleBanner1,
    TImages.articleBanner2,
    TImages.articleBanner3,
  ];

  @override
  void initState() {
    super.initState();
    searchController.clear(); // Reset teks search
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ArticleController articlecontroller = Get.find();
      articlecontroller.searchResult.clear();
      articlecontroller.isSearching.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();

    ArticleController articlecontroller = Get.find();

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/login/wallpaper-login.png"), // Replace with your wallpaper path
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: TAppBar(onMain: true, onPetDetails: false),
          bottomNavigationBar: InsideNavBar(),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      searchbar(
                        title: 'search ‘how to play with dog',
                        controller: searchController,
                        onChanged: (value) {
                          articlecontroller.searchArticleDog(value);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      optionArticleThread(
                        article: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Most Read',
                            style: TextStyle(
                                fontFamily: 'albertsans',
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          //  GestureDetector(
                          //   onTap: () => Get.to(()=>viewMoreArticle()),
                          //   child: Text('View More >', style: TextStyle(
                          //     fontFamily: 'albertsans',
                          //     fontSize: 16,
                          //     color: Color(0xff4749AE),
                          //     decoration: TextDecoration.underline
                          //     ),)
                          //  )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      _carouselSlider(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Explore',
                                style: TextStyle(
                                    fontFamily: 'albertsans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(() => Article()),
                            child: Container(
                              width: 105,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: TColors.filter.withOpacity(0.3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              alignment: Alignment.center,
                              child: Text(
                                'All',
                                style: TextStyle(
                                    fontFamily: 'albertsans',
                                    fontSize: 16,
                                    color: Color(0xff535050)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => dogArticle()),
                            child: Container(
                              width: 105,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color(0xff21165A),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              alignment: Alignment.center,
                              child: Text(
                                'Dog',
                                style: TextStyle(
                                    fontFamily: 'albertsans',
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => catArticle()),
                            child: Container(
                              width: 105,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: TColors.filter.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  )),
                              alignment: Alignment.center,
                              child: Text(
                                'Cat',
                                style: TextStyle(
                                    fontFamily: 'albertsans',
                                    fontSize: 16,
                                    color: Color(0xff535050)),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        final isSearching =
                            articlecontroller.searchResult.isNotEmpty ||
                                articlecontroller.isSearching.value;

                        if (isSearching &&
                            articlecontroller.searchResult.isEmpty) {
                          return Center(
                            child: Text(
                              "Article not found",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        }

                        final displayedArticlesDog = isSearching
                            ? articlecontroller.searchResult
                            : articlecontroller.articlesListDog;

                        print(
                            "Total articles: ${articlecontroller.articlesListDog.length}");
                        print(
                            "Total search result: ${articlecontroller.searchResult.length}");

                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: displayedArticlesDog.length,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.white.withOpacity(0.6),
                                // height: 300,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    articleHome(
                                        article: displayedArticlesDog[index])
                                  ],
                                ),
                              );
                            });
                      })
                    ],
                  ),
                ),
              ],
            ),
          )),
        ));
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
