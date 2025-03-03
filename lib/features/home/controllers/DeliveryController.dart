import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/features/home/models/deliveryModel.dart';

class DeliveryController extends GetxController {
  static DeliveryController get instance => Get.find();
  List<DeliveryModel> deliveryList = <DeliveryModel>[];
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDelivery();
  }

  void fetchDelivery() {
    deliveryList = DeliveryModel.getDeliveryOptions();
  }

  String getFormattedEta(int index) {
    return DateFormat('dd MMM yyyy').format(deliveryList[index].eta);
  }

  void selectDelivery(int index) {
    selectedIndex.value = index;
    print(deliveryList[selectedIndex.value]);
  }
}
