import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/community/screens/Post.dart';
import 'package:pawrentingreborn/features/community/screens/Replies.dart';
import 'package:pawrentingreborn/features/community/screens/catArticle.dart';
import 'package:pawrentingreborn/features/community/screens/dogArticle.dart';
import 'package:pawrentingreborn/features/community/widget/articleHome.dart';
import 'package:pawrentingreborn/features/community/widget/optionArticleThread.dart';
import 'package:pawrentingreborn/features/community/widget/searchbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class viewMoreArticle extends StatefulWidget {
  const viewMoreArticle({super.key});

  @override
  State<viewMoreArticle> createState() => _viewMoreArticle();
}
   
class _viewMoreArticle extends State<viewMoreArticle> {
  @override
  Widget build(BuildContext context) {
  
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    
    return Scaffold(
      appBar: TAppBar2(title: 'Most Read Articles', subtitle: 'Trending Now: The Top Stories'),
       bottomNavigationBar: InsideNavBar(controller: controller, navcontroller: navcontroller),
      backgroundColor: TColors.primary,
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
                    searchbar(title: 'search ‘how to play with cat’',),
                      SizedBox(height:  15,),      

                      // Container( 
                      //   child: 
                      //   Text('Most Read Article ', style: TextStyle(fontFamily: 'albertsans', fontSize: 20, fontWeight: FontWeight.bold),),
                      //   alignment: Alignment.topLeft,
                      // ),

                      Container(
                        color: Colors.white.withOpacity(0.6),
                        // height: 300,
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            articleHome(
                              imagePath: TImages.article1,
                              title: 'First-Year Kitten Vaccination Schedule Chart to Follow',
                              subtitle: 'By Pawrenting Teams',
                            ),
                            articleHome(
                              imagePath: TImages.article2,
                              title: 'How Much Water Should a Dog Drink?',
                              subtitle: 'By Pawrenting Teams',
                            ),
                            articleHome(
                              imagePath: TImages.article3,
                              title: 'How Many Calories Should My Dog Eat?',
                              subtitle: 'By Pawrenting Teams',
                            ),
                            articleHome(
                              imagePath: TImages.article4,
                              title: 'How to Clean Pet Urine From the Carpet',
                              subtitle: 'By Pawrenting Teams',
                            ),
                            articleHome(
                              imagePath: TImages.article3,
                              title: 'How Many Calories Should My Dog Eat?',
                              subtitle: 'By Pawrenting Teams',
                            ),
                            articleHome(
                              imagePath: TImages.article3,
                              title: 'How Many Calories Should My Dog Eat?',
                              subtitle: 'By Pawrenting Teams',
                            ),articleHome(
                              imagePath: TImages.article3,
                              title: 'How Many Calories Should My Dog Eat?',
                              subtitle: 'By Pawrenting Teams',
                            ),
                             articleHome(
                              imagePath: TImages.article1,
                              title: 'First-Year Kitten Vaccination Schedule Chart to Follow',
                              subtitle: 'By Pawrenting Teams',
                            ),
                             articleHome(
                              imagePath: TImages.article1,
                              title: 'First-Year Kitten Vaccination Schedule Chart to Follow',
                              subtitle: 'By Pawrenting Teams',
                            ),
                          ],
                        ),
                      )

                    
                      ],         
                            ),
                            
 
                        ),
                      
                  ],//disini
                ),
              )
          ),
        );
  }
}