import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/community/widget/chooseTopic.dart';
import 'package:pawrentingreborn/features/community/widget/selectedSpecies.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class Addthreads extends StatelessWidget {
  const Addthreads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar2(
          title: TTexts.appBarAddThreadTitle,
          subtitle: TTexts.appBarAddThreadSub,
        ),
        backgroundColor: TColors.primary,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add Picture',
                          style: TextStyle(
                              fontFamily: 'albertsans',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
                Container(
                    width: 180,
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffF8F6FD),
                        border: Border.all(
                            color: Color(0xff8B68CC).withOpacity(0.6))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(TImages.Plus),
                          height: 60,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Topic',
                                style: TextStyle(
                                    fontFamily: 'albertsans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              chooseTopic(),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Species',
                                style: TextStyle(
                                    fontFamily: 'albertsans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SpeciesSelection(),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Title',
                                style: TextStyle(
                                    fontFamily: 'albertsans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color:
                                          Color(0xff8B68CC).withOpacity(0.6)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 320,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Add your title here'),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Details',
                                style: TextStyle(
                                    fontFamily: 'albertsans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color:
                                          Color(0xff8B68CC).withOpacity(0.6)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 320,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Add your details here'),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ])
                      ],
                    )),
                GestureDetector(
                  onTap: () => Get.to(() => NavigationMenu()),
                  child: Container(
                    width: 140,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff4749AE),
                    ),
                    child: Text(
                      'Post',
                      style: TextStyle(
                          fontFamily: 'albertsans',
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    alignment: Alignment.center,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
