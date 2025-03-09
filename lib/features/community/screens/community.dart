import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/features/community/controller/ThreadController.dart';
import 'package:pawrentingreborn/features/community/models/thread_message.dart';
import 'package:pawrentingreborn/features/community/screens/Post.dart';
import 'package:pawrentingreborn/features/community/screens/Replies.dart';
import 'package:pawrentingreborn/features/community/screens/addThreads.dart';
import 'package:pawrentingreborn/features/community/screens/threadDetail.dart';
import 'package:pawrentingreborn/features/community/widget/ThreadCard.dart';
import 'package:pawrentingreborn/features/community/widget/optionArticleThread.dart';
import 'package:pawrentingreborn/features/community/widget/searchbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    ThreadController threadController = Get.put(ThreadController());
    final CollectionReference threadCollection = FirebaseFirestore.instance.collection('threads');

    return Scaffold(
      appBar: TAppBar(onMain: true, onPetDetails: false),
      floatingActionButton: Container(
        width: 90,
        child: FloatingActionButton(
          onPressed: () {
            print(threadController.threadsList.length);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Addthreads()));
          },
          backgroundColor: Color(0xff4749AE),
          child: Text(
            '+ Add',
            style: TextStyle(
              fontFamily: 'Alata',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                child: Column(
                  children: [
                    searchbar(title: 'search ‘how to play with cat’', controller: searchController,
                    onChanged: (value){
                    threadController.searchThread(value);
                    },),
                    SizedBox(height: 10),
                    optionArticleThread(article: false),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Container(
                        //   width: 110,
                        //   height: 30,
                        //   decoration: BoxDecoration(
                        //     color: Color(0xff21165A),
                        //     borderRadius: BorderRadius.all(Radius.circular(15)),
                        //   ),
                        //   alignment: Alignment.center,
                        //   child: Text(
                        //     'All',
                        //     style: TextStyle(
                        //       fontFamily: 'albertsans',
                        //       fontSize: 16,
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                        // GestureDetector(
                        //   onTap: () => Get.to(() => Post()),
                        //   child: Container(
                        //     width: 110,
                        //     height: 30,
                        //     decoration: BoxDecoration(
                        //       color: TColors.filter.withOpacity(0.3),
                        //       borderRadius: BorderRadius.all(Radius.circular(15)),
                        //     ),
                        //     alignment: Alignment.center,
                        //     child: Text(
                        //       'Post',
                        //       style: TextStyle(
                        //         fontFamily: 'albertsans',
                        //         fontSize: 16,
                        //         color: Color(0xff535050),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // GestureDetector(
                        //   onTap: () => Get.to(() => Replies()),
                        //   child: Container(
                        //     width: 110,
                        //     height: 30,
                        //     decoration: BoxDecoration(
                        //       color: TColors.filter.withOpacity(0.3),
                        //       borderRadius: BorderRadius.all(Radius.circular(15)),
                        //     ),
                        //     alignment: Alignment.center,
                        //     child: Text(
                        //       'Replies',
                        //       style: TextStyle(
                        //         fontFamily: 'albertsans',
                        //         fontSize: 16,
                        //         color: Color(0xff535050),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    // SizedBox(height: 10),
                    
               Obx(() {
  final isSearching = threadController.searchResults.isNotEmpty || threadController.isSearching.value;

  if (isSearching && threadController.searchResults.isEmpty) {
    return Center(
      child: Text(
        "Thread not found",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  final displayedThreads = isSearching ? threadController.searchResults : threadController.threadsList;

  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: displayedThreads.length,
    itemBuilder: (context, index) {
      return Thread(message: displayedThreads[index]);
    },
  );
}),

                    // StreamBuilder(
                    //   stream: threadCollection.snapshots(),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.connectionState == ConnectionState.waiting) {
                    //       return Center(child: CircularProgressIndicator());
                    //     } else if (snapshot.hasError) {
                    //       return Center(child: Text('Error: ${snapshot.error}'));
                    //     }

                    //     final messages = snapshot.data?.docs ?? [];

                    //     return ListView.builder(
                    //       shrinkWrap: true,
                    //       physics: NeverScrollableScrollPhysics(),
                    //       itemCount: messages.length,
                    //       itemBuilder: (context, index) {
                    //         final messageData = messages[index].data() as Map<String, dynamic>;

                    //         DateTime createdAt = DateTime.now();
                    //         if (messageData.containsKey('createdAt') && messageData['createdAt'] != null) {
                    //           createdAt = (messageData['createdAt'] as Timestamp).toDate();
                    //         }

                            // final message = ThreadMessage(
                            //   id: messageData['id'] ?? 'defaultId',
                            //   senderProfile: messageData['senderProfile'] ?? TImages.user,
                            //   threadImage: messageData['threadImage'] ?? TImages.articleBanner1,
                            //   senderName: messageData['senderName'] ?? 'Anonymous',
                            //   title: messageData['title'] ?? 'defaultTitle',
                            //   details: messageData['details'] ?? 'defaultSubtitle',
                            //   createdAt: createdAt,
                            //   isLiked: messageData['isLiked'] ?? false,
                            //   topic: messageData['topic'] ?? 'defaultTopic',
                            //   likeCount: messageData['likeCount'] ?? 0,
                            //   commentCount: messageData['commentCount'] ?? 0
                            // );

                    //         return Thread(message: message);
                    //       },
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
