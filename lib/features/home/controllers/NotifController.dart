import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/notifRepo.dart';
import 'package:pawrentingreborn/features/home/models/notifModel.dart';


class Notifcontroller extends GetxController{
  final notifRepo = NotifRepo.instance;
  RxList<NotifModel> notifList = <NotifModel>[].obs;

  @override
  void onInit() {
    fetchNotif();
    ever(notifList, (_){
      for(var notif in notifList){
        print(notif.title);
      }
    });
    super.onInit();
  }

  Future<void> fetchNotif() async {
    final notifs = await notifRepo.getNotifs();
    notifList.assignAll(notifs);
  }

  void addNotif(NotifModel notif) async {
    await notifRepo.addNotif(notif);
    notifList.add(notif);
  }

  void testAdd() async {
    NotifModel notif = NotifModel(
      notifId: 'N01',
      userId: FirebaseAuth.instance.currentUser!.uid,
      title: 'Test Notif',
      content: 'This is a test notif',
      image: "assets/images/welcomeNotif.png"
    );
    await notifRepo.addNotif(notif);
    notifList.add(notif);
  }
  
}