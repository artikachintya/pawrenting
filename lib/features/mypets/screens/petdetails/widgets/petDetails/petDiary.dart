
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/petDiary.dart';

class PetDiary extends StatelessWidget {
  const PetDiary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Diary', style: TextStyle(
                fontSize: 24,
                fontFamily: 'Alata',
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold
              ),),
              GestureDetector(
                onTap: (){
                  Get.to(()=>PetDiaryPage());
                },
                child: Text('More', style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Alata'
                ),),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          height: 250,
          width: 375,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('There is no entry today.'),
          ),
        ),
      ]
    );
  }
}
