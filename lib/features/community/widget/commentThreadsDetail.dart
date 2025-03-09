import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pawrentingreborn/features/community/controller/commentController.dart';
import 'package:pawrentingreborn/features/community/models/thread_comment.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class CommentThreadDetails extends StatelessWidget {
  final ThreadComment comment;
  
  const CommentThreadDetails({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
 
   
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Image(image: AssetImage(TImages.user),height: 40,),
        Container(
          // color: Colors.red,
          // width: 250,
          padding: const EdgeInsets.symmetric(horizontal: 5, ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text(comment.userName, style: TextStyle(fontFamily: 'alata', fontSize: 16),),
                SizedBox(width: 15,),
                Text(_getTimeDifference(comment.createdAt), style: TextStyle(fontFamily: 'alata', fontSize: 12, color: Color(0xff4E4E4E)),)
              ],),
              
                  Text(
                  comment.comment, 
                  style: TextStyle(
                    fontFamily: 'alata', 
                    fontSize: 14, 
                    color: Color(0xff4e4e4e)
                  ),
                  ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //      Image(image: AssetImage(TImages.lopek), height: 20,),
              //      SizedBox(width: 7,),
              //      Text('10', style: TextStyle(fontFamily: 'albertsans', fontSize: 16, color: Color(0xff4e4e4e)),),
              //      SizedBox(width: 15,),
              //      Image(image: AssetImage(TImages.cett), height: 20,),
              //      SizedBox(width: 7,),
              //      Text('5', style: TextStyle(fontFamily: 'albertsans', fontSize: 16, color: Color(0xff4e4e4e)),)
              //   ],
              // ),
    
              // Container(
              //   width: 280,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5),
              //     color: Color(0xff9E9E9E).withOpacity(0.3),
              //   ),
              //   margin: EdgeInsets.only(left: 10, top: 10,),
              //   padding: EdgeInsets.only(left: 12, top: 10, bottom: 5),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text('Replying to @isaurazry_', style: TextStyle(fontFamily: 'alata', fontSize: 11, color: Color(0xff4e4e4e)),),
              //       SizedBox(height: 2,),
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Image(image: AssetImage(TImages.user), height: 40,),
              //           Container(
              //             width: 190,
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                  Text('@pecinta_kucing', style: TextStyle(fontFamily: 'alata', fontSize: 16),),
              //               Text('Terima kasih ya kak. Mohon bantuannya.', style: TextStyle(fontFamily: 'alata', fontSize: 14, color: Color(0xff4e4e4e)),)
              //               ]
              //             ),
              //           )
              //         ],
              //       )
                  
              //     ],
              //   ),
                
              // ),
            ],
          ),
        
        ),
      ],
    );

        
  }

    String _getTimeDifference(DateTime createdAt) {
      final difference = DateTime.now().difference(createdAt);
      if (difference.inDays > 0) {
        return '${difference.inDays}d';
      } else if (difference.inHours > 0) {
        return '${difference.inHours}h';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes}m';
      } else {
        return 'Just now';
      }
      }
}
