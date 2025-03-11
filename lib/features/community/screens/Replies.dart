import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/community/screens/Post.dart';
import 'package:pawrentingreborn/features/community/widget/optionArticleThread.dart';
import 'package:pawrentingreborn/features/community/widget/searchbar.dart';
import 'package:pawrentingreborn/features/home/screens/home.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class Replies extends StatelessWidget {
  const Replies({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();

    return Scaffold(
      appBar: TAppBar(onMain: true, onPetDetails: false),
      // floatingActionButton: Container(
      //   width: 100,
      //   height: 50,
      //   child: FloatingActionButton(onPressed: (){}, backgroundColor: Color(0xff4749AE),
      //   child:
      //   Text('+ Add', style: TextStyle(fontFamily: 'Alata', fontSize: 15, color: Colors.white,),),),
      // ),
      backgroundColor: TColors.primary,
      bottomNavigationBar: InsideNavBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            Container(
              // height: 2000,
              width: double.maxFinite,
              child: Column(
                children: [
                  // searchbar(title: 'search ‘how to play with cat’',),
                  SizedBox(
                    height: 10,
                  ),
                  optionArticleThread(
                    article: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //   width: 50,
                      //   height: 25,

                      //   decoration: BoxDecoration(
                      //     color: TColors.filter.withOpacity(0.3),
                      //     borderRadius: BorderRadius.all(
                      //       Radius.circular(10)
                      //     )

                      //   ),
                      //   alignment: Alignment.center,
                      //   child: Icon(Icons.tune_rounded, color: Color(0xff535050),),
                      // ),

                      GestureDetector(
                        onTap: () => Get.to(() => Home()),
                        child: Container(
                          width: 110,
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
                        onTap: () => Get.to(() => Post()),
                        child: Container(
                          width: 110,
                          height: 30,
                          decoration: BoxDecoration(
                              color: TColors.filter.withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          alignment: Alignment.center,
                          child: Text(
                            'Post',
                            style: TextStyle(
                                fontFamily: 'albertsans',
                                fontSize: 16,
                                color: Color(0xff535050)),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () => Get.to(() => Replies()),
                        child: Container(
                          width: 110,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color(0xff21165A),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          alignment: Alignment.center,
                          child: Text(
                            'Replies',
                            style: TextStyle(
                                fontFamily: 'albertsans',
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5),
                        border: Border.all(
                            color: Color(0xff8B68CC).withOpacity(0.6))),
                    padding: EdgeInsets.only(
                        left: 20, top: 10, right: 10, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage(TImages.user),
                              height: 30,
                            ),
                            Text(
                              '@pawrenting_user',
                              style: TextStyle(
                                  fontFamily: 'alata',
                                  fontSize: 13,
                                  color: Color(0xff4E4E4E)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Tolongggg kucing saya kaburrrr ...",
                              style: TextStyle(
                                  fontFamily: 'albertsans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Bagi teman-teman yang bisa menemukan kucing\nsaya,tolong hubungi saya di no 082917353728. Saya...",
                              style:
                                  TextStyle(fontFamily: 'alata', fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 120,
                    width: 360,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Image(
                                  image: AssetImage(TImages.forwardarrow2),
                                  height: 30,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color:
                                            Color(0xff9E9E9E).withOpacity(0.3)),
                                    height: 60,
                                    width: 300,
                                    padding: EdgeInsets.only(
                                        left: 12,
                                        right: 10,
                                        top: 10,
                                        bottom: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Replying to @isaurazry_',
                                              style: TextStyle(
                                                  fontFamily: 'alata',
                                                  fontSize: 13,
                                                  color: Color(0xff4E4E4E)),
                                            ),
                                            Text(
                                              '2 days ago',
                                              style: TextStyle(
                                                  fontFamily: 'alata',
                                                  fontSize: 11,
                                                  color: Color(0xff4E4E4E)),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Terima kasih ya kak. Mohon bantu...',
                                                  style: TextStyle(
                                                      fontFamily: 'alata',
                                                      fontSize: 16,
                                                      color: Color(0xff4E4E4E)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
