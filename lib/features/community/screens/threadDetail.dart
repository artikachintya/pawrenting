import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/community/controller/ThreadController.dart';
import 'package:pawrentingreborn/features/community/controller/commentController.dart';
import 'package:pawrentingreborn/features/community/models/thread_comment.dart';
import 'package:pawrentingreborn/features/community/models/thread_message.dart';
import 'package:pawrentingreborn/features/community/widget/commentThreadsDetail.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:get/get.dart';

class threadDetail extends StatefulWidget {
  final ThreadMessage message;

  const threadDetail({super.key, required this.message});

  @override
  _threadDetailState createState() => _threadDetailState();
}

class _threadDetailState extends State<threadDetail> {
  late bool isLiked;
  late int likeCount;
  bool isUpdating = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.message.isLiked;
    likeCount = widget.message.likeCount;

    final CommentController commentController = Get.put(CommentController());
    commentController.fetchComments(widget.message.id);
  }

  Future<void> _toggleLike() async {
    if (isUpdating) return; // Prevent multiple updates

    setState(() {
      isUpdating = true;
    });

    bool newIsLiked = !isLiked;
    int newLikeCount = likeCount + (newIsLiked ? 1 : -1);
    try {
      DocumentReference docRef = FirebaseFirestore.instance
          .collection('threads')
          .doc(widget.message.id);

      // Check if the document exists
      DocumentSnapshot docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        // Update Firestore
        await docRef.update({
          'isLiked': newIsLiked,
          'likeCount': newLikeCount,
          'commentCount': widget.message.commentCount,
        });

        // Ensure the UI updates only after a successful Firestore update
        setState(() {
          isLiked = newIsLiked;
          likeCount = newLikeCount;
          ThreadController threadController = Get.find();
          int threadIndex = threadController.threadsList
              .indexWhere((t) => t.id == widget.message.id);
          if (threadIndex != -1) {
            threadController.threadsList[threadIndex].isLiked = newIsLiked;
            threadController.threadsList[threadIndex].likeCount = newLikeCount;
            threadController.threadsList.refresh();
          }
        });
      } else {
        // Handle document not found scenario
        print('Document not found. Ensure the document ID is correct.');
        setState(() {
          isUpdating = false;
        });
      }
    } catch (e) {
      // Handle Firestore update failure
      print('Error updating Firestore: $e');
      setState(() {
        isUpdating = false;
      });
    } finally {
      setState(() {
        isUpdating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    try {
      imageBytes = base64Decode(widget.message.threadImage);
    } catch (e) {
      debugPrint("Error decoding image: $e");
    }

    final message = widget.message;
    final CommentController commentController = Get.put(CommentController());
    final ThreadController threadController = Get.put(ThreadController());
    final TextEditingController commentTextController = TextEditingController();
    final FirebaseAuth auth = FirebaseAuth.instance;
    NavBarController controller = Get.find();

    return Scaffold(
      appBar: TAppBar2(
        title: TTexts.appBarThreadsTitle,
        subtitle: TTexts.appBarThreadsSub,
      ),
      backgroundColor: TColors.primary,
      bottomNavigationBar: InsideNavBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage(
                          message.senderProfile.isNotEmpty
                              ? message.senderProfile
                              : TImages.user,
                        ),
                        height: 45,
                      ),
                      Text(
                        message.senderName,
                        style: TextStyle(fontFamily: 'alata', fontSize: 20),
                      )
                    ],
                  ),
                  Container(
                    // width: 73,
                    height: 20,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff8B68CC).withOpacity(0.4),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      message.topic,
                      style: TextStyle(
                        fontFamily: 'albertsans',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 160,
                      width: 335,
                      child: imageBytes != null
                            ? Image.memory(imageBytes, fit: BoxFit.cover)
                            : const Icon(Icons.image_not_supported),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  GestureDetector(
                    onTap: _toggleLike,
                    child: Image(
                      image: AssetImage(TImages.lopek),
                      height: 20,
                      color: isLiked ? Colors.red : null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '$likeCount',
                    style: TextStyle(
                      fontFamily: 'albertsans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isLiked ? Colors.red : Color(0xff706e73),
                    ),
                  ),
                ],
              ),
              Container(
                width: 350,
                child: Text(
                  message.title,
                  style: TextStyle(
                    fontFamily: 'albertsans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 350,
                child: Text(
                  message.details,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 14,
                    color: Color(0xff4E4E4E),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    _getTimeDifference(message.createdAt),
                    style: TextStyle(
                      fontFamily: 'alata',
                      fontSize: 12,
                      color: Color(0xff4E4E4E).withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${commentController.threadsCommentList.length} Replies',
                      style: TextStyle(
                        fontFamily: 'albertsans',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4E4E4E),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border:
                        Border.all(color: Color(0xff8B68CC).withOpacity(0.6)),
                  ),
                  width: 370,
                  padding: EdgeInsets.only(left: 25, top: 15, bottom: 15),
                  child: Obx(() {
                    // print("Comment list length: ${commentController.threadsCommentList.length}");
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15),
                      itemCount: commentController.threadsCommentList.length,
                      itemBuilder: (context, index) {
                        return CommentThreadDetails(
                            comment:
                                commentController.threadsCommentList[index]);
                      },
                    );
                  })),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  border: Border.all(color: Color(0xff8B68CC).withOpacity(0.6)),
                ),
                width: 370,
                padding: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(TImages.user),
                      height: 40,
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 100,
                      child: TextFormField(
                        controller: commentController.commentController,
                        decoration: InputDecoration(
                          labelText: 'Add a new comment',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (commentController
                            .commentController.text.isNotEmpty) {
                          commentController.addComment(widget.message.id);
                          threadController.updateThread(widget.message.id);
                        }
                      },
                      child: Image(
                          image: AssetImage(TImages.sendLogos), width: 30),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThreadImage(ThreadMessage message) {
    if (message.threadImage.startsWith('http')) {
      return Image.network(message.threadImage, fit: BoxFit.cover);
    } else {
      return Image.asset(message.threadImage, fit: BoxFit.cover);
    }
  }

  String _getTimeDifference(DateTime createdAt) {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${difference.inDays ~/ 7}w ago';
    }
  }
}
