import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/community/models/article_models.dart';
import 'package:pawrentingreborn/features/community/screens/article.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class articleDetail extends StatelessWidget {
  final ArticleModels article;
  const articleDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();

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
          appBar: TAppBar2(
              title: TTexts.appBarArticleTitle,
              subtitle: TTexts.appBarArticleSub),
          bottomNavigationBar: InsideNavBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF8F6FD),
                ),
                // height: 1000,
                padding:
                    EdgeInsets.only(bottom: 60, top: 10, left: 10, right: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: TextStyle(
                            fontFamily: 'albertsans',
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),

                      Text(
                        article.subtitle,
                        style: TextStyle(
                          color: Color(0xff4e4e4e),
                          fontFamily: 'alata',
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.justify,
                      ),

                      //  Text('Updated on December 12, 2024',
                      //  style: TextStyle(
                      //   fontFamily: 'alata',
                      //   fontSize: 15,
                      //   color: Color(0xff4e4e4e),
                      //  ),
                      //  textAlign: TextAlign.justify,
                      //  ),

                      SizedBox(
                        height: 10,
                      ),

                      Image(
                        image: AssetImage(article.imageUrl),
                        height: 250,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        article.content,
                        style: TextStyle(fontFamily: 'alata', fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),

                      //  SizedBox(height: 10,),
                      //  Text('Kitten sneezing can be caused by anything from harmless environmental irritants to more serious issues like upper respiratory infections or allergies. Understanding the potential causes behind your kittens sneezing is important to determine whether it is something that can be monitored at home or if it is time for a veterinary visit.',
                      //  style: TextStyle(
                      //   fontFamily: 'alata',
                      //   fontSize: 14
                      //  ),
                      //  textAlign: TextAlign.justify,
                      //  ),

                      //  SizedBox(height: 10,),
                      //  Text('Why Do Kittens Sneeze? ', style: TextStyle(
                      //   fontFamily: 'albertsans',
                      //   fontSize: 20,
                      //   fontWeight: FontWeight.bold,
                      //  ),
                      //  textAlign: TextAlign.justify,
                      //  ),

                      //      SizedBox(height: 10,),
                      //      Text(
                      //         'Kittens can sneeze for a variety of reasons. Common causes of kitten sneezing include:',
                      //         style: TextStyle(fontSize: 14, fontFamily: 'alata'),
                      //         textAlign: TextAlign.justify,
                      //       ),
                      // SizedBox(height: 10),
                      // Container(
                      //   height: 300,
                      //   child: ListView(
                      //     physics: NeverScrollableScrollPhysics(),
                      //     children: [
                      // ListTile(
                      //   contentPadding: EdgeInsets.zero,
                      //   leading: Text('•', style: TextStyle(fontSize: 24, color: Colors.black)),
                      //   title: Text('Odd or noxious smells, such as from cleaning products or cooking spicy food',
                      //   style: TextStyle(
                      //     fontFamily: 'alata', fontSize: 14,
                      //   ) ,
                      //   textAlign: TextAlign.justify,
                      //   ),
                      // ),
                      // ListTile(
                      //   contentPadding: EdgeInsets.zero,
                      //   leading: Text('•', style: TextStyle(fontSize: 24, color: Colors.black)),
                      //   title: Text('Airborne irritants, such as dust, dusty cat litter, pollen, perfume, or cigarette smoke',
                      //   style: TextStyle(
                      //     fontFamily: 'alata', fontSize: 14
                      //   ) ,
                      //   textAlign: TextAlign.justify,
                      //   ),
                      // ),
                      // ListTile(
                      //   contentPadding: EdgeInsets.zero,
                      //   leading: Text('•', style: TextStyle(fontSize: 24, color: Colors.black)),
                      //   title: Text('Upper respiratory infections',
                      //     style: TextStyle(
                      //     fontFamily: 'alata', fontSize: 14
                      //   ),
                      //   textAlign: TextAlign.justify,
                      //   ),
                      // ),
                      // ListTile(
                      //   contentPadding: EdgeInsets.zero,
                      //   leading: Text('•', style: TextStyle(fontSize: 30, color: Colors.black)),
                      //   title: Text('Inflammation of the nasal cavity or sinuses',
                      //    style: TextStyle(
                      //     fontFamily: 'alata', fontSize: 14
                      //    ),
                      //    textAlign: TextAlign.justify,
                      //    ),
                      // ),
                    ]

                    // ),

                    // ),

                    //   ],
                    ),
              ),
            ),
          ),
        ));
  }
}
