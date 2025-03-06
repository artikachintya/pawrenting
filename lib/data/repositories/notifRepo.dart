import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/models/notifModel.dart';

class NotifRepo extends GetxController{
  static NotifRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  addNotif(NotifModel notif){
    print('add notif');
    _db.collection('notifications').add(notif.toJson());
  }

  Future<List<NotifModel>> getNotifs() async {
    final snapshot = await _db.collection('notifications').get();
    print("Fetched ${snapshot.docs.length} notifications"); // Debugging
    return snapshot.docs.map((e) {
      print("Notif Data: ${e.data()}"); // Debugging
      return NotifModel.fromSnapshot(e);
    }).toList();
  }
}