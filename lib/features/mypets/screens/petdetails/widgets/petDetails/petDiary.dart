import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/DiaryController.dart';
import 'package:pawrentingreborn/features/mypets/models/PetModel.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/petDiary.dart';

class PetDiary extends StatelessWidget {
  final PetModel pet;
  const PetDiary({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    DiaryController diaryController = Get.find();
    return Obx(() => Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Diary',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Alata',
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => PetDiaryPage(
                          pet: pet,
                        ));
                  },
                  child: Text(
                    'More',
                    style: TextStyle(fontSize: 20, fontFamily: 'Alata'),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            height: 250,
            width: 375,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                diaryController.diaryList.length == 0
                    ? 'There is no entry today...'
                    : diaryController.diaryList.first.content,
                style: TextStyle(fontSize: 14, fontFamily: 'Albert Sans'),
              ),
            ),
          ),
        ]));
  }
}
