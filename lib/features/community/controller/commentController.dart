
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawrentingreborn/features/community/models/thread_comment.dart';

class CommentController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  RxList<ThreadComment> comments = <ThreadComment>[].obs;
  
  Stream<List<ThreadComment>> getComments(String threadId) {
    return _firestore
        .collection('threads')
        .doc(threadId)
        .collection('comments')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => ThreadComment.fromJson(doc.data())).toList());
  }

  Future<void> addComment(String threadId, String commentText) async {
    if (commentText.isEmpty) return;

    final user = _auth.currentUser;
    if (user == null) return;

    final userDoc = await _firestore.collection('users').doc(user.uid).get();
    final userName = userDoc['name'] ?? 'Anonymous';
    final userProfile = userDoc['profilePicture'] ?? '';

    final newComment = ThreadComment(
      id: _firestore.collection('threads').doc(threadId).collection('comments').doc().id,
      threadId: threadId,
      userId: user.uid,
      userName: userName,
      userProfile: userProfile,
      comment: commentText,
      createdAt: DateTime.now(),
    );

    await _firestore
        .collection('threads')
        .doc(threadId)
        .collection('comments')
        .doc(newComment.id)
        .set(newComment.toJson());
  }
}
