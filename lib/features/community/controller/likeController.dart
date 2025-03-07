import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LikeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxBool isUpdating = false.obs;

  Future<void> toggleLike(String threadId, bool isLiked, int likeCount) async {
    if (isUpdating.value) return; // Mencegah update ganda

    isUpdating.value = true;

    bool newIsLiked = !isLiked;
    int newLikeCount = likeCount + (newIsLiked ? 1 : -1);

    try {
      DocumentReference docRef = _firestore.collection('threads').doc(threadId);
      DocumentSnapshot docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        await docRef.update({
          'isLiked': newIsLiked,
          'likeCount': newLikeCount,
        });
      }
    } catch (e) {
      print('Error updating Firestore: $e');
    } finally {
      isUpdating.value = false;
    }
  }
}
