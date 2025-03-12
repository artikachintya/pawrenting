import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/community/controller/addThreadController.dart';
import 'package:pawrentingreborn/features/community/widget/chooseTopic.dart';
import 'package:pawrentingreborn/features/community/widget/selectedSpecies.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class Addthreads extends StatefulWidget {
  Addthreads({super.key});

  @override
  _AddthreadsState createState() => _AddthreadsState();
}

class _AddthreadsState extends State<Addthreads> {
  AddThreadController addThreadController = Get.put(AddThreadController());

  final currentUser = FirebaseAuth.instance.currentUser;
  
  String userName = '';
  String _imagePath = TImages.articleBanner1; 
  String selectedTopic = 'Adoption'; 
  // String defaultSenderProfile = TImages.user;

  

  Future<void> getCurrentUsername() async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();
      setState(() {
        userName = userDoc['name'] ?? 'Anonymous'; // Ensure userName is not null
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUsername();
  }

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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
             Obx(
            () => SizedBox(
              height: 140,
              width: 140,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 3,
                  padding: EdgeInsets.zero, // Ensure no extra padding
                ),
                onPressed: () => addThreadController.pickImage(),
                child: addThreadController.imageFile.value == null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          TImages.picIcon,
                          color: TColors.accent,
                          fit: BoxFit.contain,
                          height: 60,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox.expand(
                          // Ensures image fills button
                          child: Image.file(
                            addThreadController.imageFile.value!,
                            fit: BoxFit.cover, // Ensures better aspect ratio
                          ),
                        ),
                      ),
              ),
            ),),
              SizedBox(height: 20),
              Container(
                width: 500,
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Topic',
                      style: TextStyle(
                        fontFamily: 'albertsans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ChooseTopic(
                      onTopicSelected: (newValue) {
                        setState(() {
                          selectedTopic = newValue;
                          //  print("✅ Selected Topic: $selectedTopic"); // Debugging
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Species',
                      style: TextStyle(
                        fontFamily: 'albertsans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    SpeciesSelection(),
                    SizedBox(height: 20),
                    Text(
                      'Title',
                      style: TextStyle(
                        fontFamily: 'albertsans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xff8B68CC).withOpacity(0.6)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 320,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      child: TextFormField(
                        controller: addThreadController.titleController,
                        decoration: InputDecoration(labelText: 'Add your title here'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Details',
                      style: TextStyle(
                        fontFamily: 'albertsans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xff8B68CC).withOpacity(0.6)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 320,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      child: TextFormField(
                        controller: addThreadController.detailsController,
                        decoration: InputDecoration(labelText: 'Add your details here'),
                      ),
                    ),
                    SizedBox(height: 30),
                    
                  ],
                ),
              ),
              GestureDetector(
                      onTap: () {
                      print('Selected Topic: $selectedTopic');
                      addThreadController.createThread(selectedTopic);
                      },
                      child: Container(
                        width: 140,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff4749AE),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Post',
                          style: TextStyle(
                            fontFamily: 'albertsans',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
