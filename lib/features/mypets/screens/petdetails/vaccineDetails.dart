import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petVaccine/coreVaccine.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petVaccine/noncoreVaccine.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petVaccine/vaccineList.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petVaccine/vaccineStatus.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class VaccineDetails extends StatelessWidget {
  const VaccineDetails(
      {super.key, required this.taken, required this.name, this.date});

  final bool taken;
  final String name;
  final String? date;

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: TAppBar2(
          title: TTexts.appBarVaccineTitle, subtitle: TTexts.appBarVaccineSub),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/login/wallpaper-login.png'))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  height: 55,
                  decoration: BoxDecoration(
                      color: TColors.gray,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: TColors.accent, width: 0.5)),
                  child: Center(
                    child: Text(
                      name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                VaccineStatus(taken: taken),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 350,
                    height: 80,
                    decoration: BoxDecoration(
                        color: TColors.gray,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: TColors.accent, width: 0.5)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Alata',
                                    color: Color(0XFF555050)),
                              ),
                              Text(
                                '20 June 2024',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Alata',
                                    color: TColors.accent),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Time',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Alata',
                                    color: Color(0XFF555050)),
                              ),
                              Text(
                                '18:15',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Alata',
                                    color: TColors.accent),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 350,
                    height: 80,
                    decoration: BoxDecoration(
                        color: TColors.gray,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: TColors.accent, width: 0.5)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Post Vaccination Symptoms',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Add your pet\'s symptoms after the vaccination here.',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Alata',
                                color: Color(0XFFAFADAD)),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
    );
  }
}
