import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/community/controller/ArticleController.dart';
import 'package:pawrentingreborn/features/community/widget/articleHome.dart';
import 'package:pawrentingreborn/features/community/widget/searchbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

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
    ArticleController articlecontroller = Get.find();
    articlecontroller.fetchArticles('');
    
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

                      ListView.builder(
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         itemCount: articlecontroller.articlesList.length,
                        itemBuilder: (context, index) {
                      return  
                       Container(
                        color: Colors.white.withOpacity(0.6),
                        // height: 300,
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             articleHome(article: articlecontroller.articlesList[index])
                            
                          ],
                        ),
                      );
                      
                      })

                    
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