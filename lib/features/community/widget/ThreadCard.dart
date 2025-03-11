import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/community/controller/commentController.dart';
import 'package:pawrentingreborn/features/community/models/thread_message.dart';
import 'package:pawrentingreborn/features/community/screens/threadDetail.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class Thread extends StatelessWidget {
  const Thread({
    super.key,
    required this.message,
  });

  final ThreadMessage message;

  @override
  Widget build(BuildContext context) {
    CommentController commentController = Get.find();
    return GestureDetector(
      onTap: () {
        commentController.fetchComments(message.id);
        Get.to(() => threadDetail(message: message));
      },
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: 355,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.5),
              border: Border.all(color: Color(0xff8B68CC).withOpacity(0.6)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // width: 73,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff8B68CC).withOpacity(0.4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        message.topic,
                        style: TextStyle(
                            fontFamily: 'albertsans',
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(_getTimeDifference(message.createdAt),
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF4E4E4E),
                            fontFamily: 'alata')),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 107,
                        width: 91,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: _buildThreadImage(),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      padding: EdgeInsets.only(left: 10, right: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage(TImages.user),
                                height: 30,
                              ),
                              Text(
                                message.senderName,
                                style: TextStyle(
                                  fontFamily: 'Alata',
                                  fontSize: 13,
                                  color: Color(0xff4E4E4E),
                                ),
                              )
                            ],
                          ),
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            message.title,
                            style: TextStyle(
                                fontFamily: 'albertsans',
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            message.details,
                            style: TextStyle(
                                fontFamily: 'alata',
                                fontSize: 11,
                                color: Color(0xff4E4E4E)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            width: 2000,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image(
                                  image: AssetImage(TImages.lopek),
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  message.likeCount.toString(),
                                  style: TextStyle(
                                    fontFamily: 'albertsans',
                                    fontSize: 16,
                                    color: Color(0xff4E4E4E),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Image(
                                  image: AssetImage(TImages.cett),
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  message.commentCount.toString(),
                                  style: TextStyle(
                                    fontFamily: 'albertsans',
                                    fontSize: 16,
                                    color: Color(0xff4E4E4E),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThreadImage() {
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
