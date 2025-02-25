import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';


class VoucherController extends GetxController {
  Rx<bool> isSelected = true.obs;

  void toggleVoucher() {
    isSelected.value = !isSelected.value;
  }
}
