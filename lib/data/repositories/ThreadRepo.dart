import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/authentication/model/UserModel.dart';
import 'package:pawrentingreborn/features/community/models/thread_message.dart';

class ThreadRepo extends GetxController {
  static ThreadRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

      Future<List<ThreadMessage>> fetchThread() async {
    final snapshot = await _db.collection('threads').get();
    return snapshot.docs.map((e) {
      print("Product Data: ${e.data()}"); // Debuggin
      return ThreadMessage.fromSnapshot(e);
    }).toList();
  }

      createThread(ThreadMessage thread){
    print('create user');
    _db.collection('threads').add(thread.toJson());
  }

  
}