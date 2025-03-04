import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pawrentingreborn/data/repositories/LocationRepo.dart';
import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';

class LocationController extends GetxController {
  static LocationController get instance => Get.find();
  final locationRepo = LocationRepo.instance;
  final _auth = FirebaseAuth.instance;
  RxList<LocationModel> locationsList = <LocationModel>[].obs;
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLocations();
  }

  Future<void> fetchLocations() async {
    print('fetch location');
    final locations =
        await locationRepo.getUserLocations(_auth.currentUser!.email!);
    locationsList.assignAll(locations);
  }
}
