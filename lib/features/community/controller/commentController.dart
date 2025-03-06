import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pawrentingreborn/data/repositories/CommentRepo.dart';
import 'package:pawrentingreborn/data/repositories/ThreadRepo.dart';
import 'package:pawrentingreborn/data/repositories/UserRepo.dart';
import 'package:pawrentingreborn/features/authentication/model/UserModel.dart';
import 'package:pawrentingreborn/features/community/models/thread_comment.dart';
import 'package:pawrentingreborn/features/community/models/thread_message.dart';
import 'package:pawrentingreborn/features/community/widget/commentThreadsDetail.dart';
import 'package:pawrentingreborn/features/home/models/categoryModel.dart';

class CommentController extends GetxController {
  final commentRepo = CommentRepo.instance;
  final userRepo = UserRepo.instance;
  final _auth = FirebaseAuth.instance;
  final commentController = TextEditingController();

  RxList<ThreadComment> threadsCommentList = <ThreadComment>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> fetchComments(String threadId) async {
    // final snapshot = await threadRepo.fetchThread();
    threadsCommentList.clear();
    final comments = await commentRepo.getComments(threadId);
    threadsCommentList.assignAll(comments);
    update();
  }

void addComment(String threadId) async {
  String comment = commentController.text;
  UserModel? user = await userRepo.fetchUserByEmail(_auth.currentUser!.email!);
  ThreadComment threadComment = ThreadComment(
    id: FirebaseFirestore.instance.collection('commentThreads').doc().id, 
    threadId: threadId, 
    userId: FirebaseAuth.instance.currentUser!.uid, 
    userName: user!.username, 
    userProfile: 'assets/icons/user.png', 
    comment: comment, 
    createdAt: Timestamp.now().toDate(),
  );

  try {
    await FirebaseFirestore.instance
        .collection('commentThreads')
        .doc(threadComment.id)
        .set(threadComment.toJson());

    print(" Comment berhasil ditambahkan dengan ID: ${threadComment.id}");

    fetchComments(threadId); // Reload comments setelah menambahkan
    commentController.clear();

    Future.delayed(Duration(milliseconds: 300), () {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'Success', 
          'Comment added successfully',
          snackPosition: SnackPosition.TOP,
        );
      }
    });
      
  } catch (e) {
      Get.snackbar(
      'Error', 
      'Failed to add comment: $e',
      snackPosition: SnackPosition.TOP,
    );
  }
}


}