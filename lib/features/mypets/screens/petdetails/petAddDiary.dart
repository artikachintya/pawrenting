import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/controllers/DiaryController.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:pawrentingreborn/features/mypets/models/PetModel.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';

class Petadddiary extends StatelessWidget {
  final PetModel pet;
  const Petadddiary({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();

    return Scaffold(
      appBar: TAppBar2(
        title: 'Add Diary',
        subtitle: 'What did your pet do today?',
      ),
      backgroundColor: Color(0xFFE7DFF6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DiaryEntryBox(pet: pet),
          ],
        ),
      ),
    );
  }
}

class DiaryEntryBox extends StatefulWidget {
  final PetModel pet;
  const DiaryEntryBox({super.key, required this.pet});
  @override
  _DiaryEntryBoxState createState() => _DiaryEntryBoxState();
}

class _DiaryEntryBoxState extends State<DiaryEntryBox> {
  final TextEditingController _titleController =
      TextEditingController(text: 'TITLE');
  final TextEditingController _textController = TextEditingController();
  final DiaryController diaryController = Get.find();

  void _saveDiary() {
    String title = _titleController.text;
    String text = _textController.text;
    print(
        'Diary saved! Title: \$title, Text: \$text, Image: \${diaryController.imageFile.value?.path}');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: Container(
        width: 381,
        height: 710,
        decoration: BoxDecoration(
          color: Color(0xFFF5F3F9),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFEAE6F2),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: diaryController.titleController,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'TITLE',
                          ),
                        ),
                      ),
                      IconButton(
                        iconSize: 35,
                        icon: Icon(Icons.camera_alt_outlined,
                            color: Colors.grey[700]),
                        onPressed: () => diaryController.pickImage(),
                      ),
                    ],
                  ),
                ),
                Obx(() => diaryController.imageFile.value != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                diaryController.imageFile.value!,
                                width: 250,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close, color: Colors.black),
                              onPressed: diaryController.removeImage,
                            ),
                          ],
                        ),
                      )
                    : SizedBox()),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: diaryController.textController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Type here...',
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Alata-Regular',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      diaryController.addDiary(widget.pet.id);
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: TColors.accent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
