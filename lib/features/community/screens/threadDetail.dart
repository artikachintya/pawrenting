import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/community/widget/commentThreadsDetail.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

// ignore: camel_case_types
class threadDetail extends StatelessWidget {
  const threadDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar2(
          title: TTexts.appBarThreadsTitle, subtitle: TTexts.appBarThreadsSub),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage(TImages.user),
                        height: 45,
                      ),
                      Text(
                        '@pecinta_kucing',
                        style: TextStyle(fontFamily: 'alata', fontSize: 20),
                      )
                    ],
                  ),
                  Container(
                    width: 73,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff8B68CC).withOpacity(0.4),
                    ),
                    child: Text(
                      'Lost Pet',
                      style: TextStyle(
                          fontFamily: 'albertsans',
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.center,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 160,
                        width: 360,
                        child: Image(
                          image: AssetImage(TImages.comm),
                          fit: BoxFit.fitWidth,
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Image(image: AssetImage(TImages.lopek), height: 20),
                  SizedBox(
                    width: 10,
                  ),
                  Text('10',
                      style: TextStyle(
                          fontFamily: 'albertsans',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff706e73)))
                ],
              ),
              Container(
                  width: 350,
                  // color: Colors.orange,
                  child: Text(
                    'Tolongggg kucing saya kaburrrr, tolonggg sayaaa. Saya tidak tau lagi dia ada dimana, hiksss saya sedih banget :(',
                    style: TextStyle(
                        fontFamily: 'albertsans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                width: 350,
                // color: Colors.blueAccent,
                child: Text(
                  'Bagi teman-teman yang bisa menemukan kucing saya, tolong hubungi saya di no 082917353728. Saya sudah mencari kucing saya 2 hari. Dia sama sekali tidak pulang. Kucing saya menggunakan kalung hijau di lehernya. Bagi teman2 yang menemukan bisa hubungi saya ya. ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontFamily: 'alata',
                      fontSize: 14,
                      color: Color(0xff4E4E4E)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    '2 days ago',
                    style: TextStyle(
                        fontFamily: 'alata',
                        fontSize: 12,
                        color: Color(0xff4E4E4E).withOpacity(0.8)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '2 Replies',
                    style: TextStyle(
                        fontFamily: 'albertsans',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4E4E4E)),
                  )
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      border: Border.all(
                          color: Color(0xff8B68CC).withOpacity(0.6))),
                  width: 370,
                  padding: EdgeInsets.only(
                    left: 25,
                    top: 15,
                    bottom: 15,
                  ),
                  child: Column(
                    children: [
                      CommentThreadDetails(),
                      SizedBox(
                        height: 10,
                      ),
                      CommentThreadDetails()
                    ],
                  )),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border:
                        Border.all(color: Color(0xff8B68CC).withOpacity(0.6))),
                width: 370,
                padding: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(TImages.user),
                      height: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 100,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Add a new comment'
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
