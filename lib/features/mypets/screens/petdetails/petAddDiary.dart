import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:pawrentingreborn/navigationMenu.dart';

class Petadddiary extends StatelessWidget {
  const Petadddiary({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();

    return Scaffold(
      appBar: TAppBar2(
        title: TTexts.appBarAddDiaryTitle,
        subtitle: TTexts.appBarAddDiarySub,
      ),
      backgroundColor: Color(0xFFE7DFF6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DiaryEntryBox(),
          ],
        ),
      ),
      bottomNavigationBar: InsideNavBar(),
    );
  }
}

class DiaryEntryBox extends StatefulWidget {
  @override
  _DiaryEntryBoxState createState() => _DiaryEntryBoxState();
}

class _DiaryEntryBoxState extends State<DiaryEntryBox> {
  File? _image;
  final TextEditingController _titleController =
      TextEditingController(text: "TITLE");

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  /// Menampilkan bottom sheet untuk memilih antara Kamera atau Galeri
  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Pilih dari Galeri'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Ambil dari Kamera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _removeImage() {
    setState(() {
      _image = null;
    });
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
                // Header (TITLE dan Ikon Kamera)
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
                          controller: _titleController,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "TITLE",
                          ),
                        ),
                      ),
                      IconButton(
                        iconSize: 35, // Set the size of the icon
                        icon: Icon(Icons.camera_alt_outlined,
                            color: Colors.grey[700]),
                        onPressed: () => _showPicker(context),
                      ),
                    ],
                  ),
                ),

                // Gambar yang diunggah
                if (_image != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(alignment: Alignment.topRight, children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _image!,
                          width: 250,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Tombol hapus untuk menghapus gambar
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.black),
                        onPressed: _removeImage,
                      ),
                    ]),
                  ),

                // Input Text
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: "Type here...",
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Alata-Regular'),
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
