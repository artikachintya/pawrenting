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
      title: 'Hi, Kimdash! Welcome to  Pawrenting!',
content: 'Welcome to Pawrenting! We\'re so excited to have you here! Whether you\'re here to connect with fellow pet parents, discover tips for caring for your furry friends, or just celebrate the joys of pet ownership, you\'re in the purr-fect place. \n\nHere\'s how you can get started:\nExplore our [features, e.g., myPet, community forums, or activity tracker].\nCheck out [our blog, tips, or FAQ page] for helpful resources.\nUpdate your profile and tell us about your beloved pet(s) to make the most of the app.\n\nNeed help or have feedback? We\'re all ears!\n Email us at: pawrenting@gmail.com Call us at: +6281234356789\n\nThank you for trusting us to be part of your pet parenting journey. Together, let\'s give your furry family members the love and care they deserve. Welcome aboard!',
      image: "assets/images/welcomeNotif.png"
    );
    await notifRepo.addNotif(notif);
    notifList.add(notif);
  }
  
}