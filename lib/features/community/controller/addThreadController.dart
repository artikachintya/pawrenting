import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/UserRepo.dart';
import 'package:pawrentingreborn/features/authentication/model/UserModel.dart';
import 'package:pawrentingreborn/features/community/controller/ThreadController.dart';
import 'package:pawrentingreborn/features/community/models/thread_message.dart';
import 'package:pawrentingreborn/data/repositories/ThreadRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddThreadController extends GetxController {
  final threadRepo = ThreadRepo.instance;
  final titleController = TextEditingController();
  final userRepo = UserRepo.instance; // Add this line
  final _auth = FirebaseAuth.instance; // Add this line
  final detailsController = TextEditingController();
  ThreadController threadController= Get.find();
  String selectedTopic = 'Adoption'; // Topik default
  String senderProfile = ''; // Menyimpan gambar profil pengguna
  Rx<File?> imageFile = Rx<File?>(null);
  RxString base64Image = ''.obs;


  final currentUser = FirebaseAuth.instance.currentUser;

  // Fungsi untuk mengambil gambar profil pengguna
  Future<void> getSenderProfile() async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();
      senderProfile = userDoc['profilePicture'] ?? 'assets/icons/user.png';
    } catch (e) {
      senderProfile = 'assets/icons/user.png'; 
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);

      // Convert image to Base64
      List<int> imageBytes = await file.readAsBytes();
      String base64String = base64Encode(imageBytes);

      // Update reactive variables
      imageFile.value = file;
      base64Image.value = base64String;
    }
  }

  void createThread(String topic) async {
    String title = titleController.text;
    String details = detailsController.text;
    selectedTopic = topic;
    UserModel? user = await userRepo.fetchUserByEmail(_auth.currentUser!.email!);
  

    // Memastikan input tidak kosong
    if (title.isEmpty || details.isEmpty) {
      Get.snackbar('Error', 'Title and details cannot be empty');
      return;
    }
    
    

    // Mengambil gambar profil terlebih dahulu
    await getSenderProfile();

    ThreadMessage thread = ThreadMessage(
      id: FirebaseFirestore.instance.collection('threads').doc().id, // ID otomatis
      senderProfile: senderProfile, // Menggunakan gambar profil yang diambil dari Firestore
      threadImage: base64Image.value, // Menyertakan gambar yang dipilih
      senderName: user!.username, // Gunakan username atau data lain
      title: title,
      details: details,
      createdAt: Timestamp.now().toDate(),
      isLiked: false,
      topic: selectedTopic, // Menggunakan topik yang dipilih
      likeCount: 0,
      commentCount: 0,
    );

    try {
      await threadRepo.createThread(thread); // Menyimpan thread ke Firebase
        Future.delayed(Duration(milliseconds: 300), () {
        if (!Get.isSnackbarOpen) {
          print("Menampilkan Snackbar..");
          Get.snackbar('Success', 'Thread created successfully',
              snackPosition: SnackPosition.TOP);
        } else {
          print("Snackbar gagal ditampilkan karena sudah terbuka.");
        }
        });
       threadController.fetchThreads();
       titleController.clear();
       detailsController.clear();
        print("✅ Data baru berhasil dikirim!");
    } catch (e) {
      Get.snackbar('Error', 'Failed to create thread');
    }
    
    Get.back();

     
  


  }
}
