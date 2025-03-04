import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pawrentingreborn/features/home/models/paymentModel.dart';

class PaymentController extends GetxController {
  static PaymentController get instance => Get.find();
  List<Paymentmodel> paymentList = <Paymentmodel>[];
  int selectedIndex = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchPayment();
    super.onInit();
  }

  void fetchPayment() {
    paymentList = Paymentmodel.getpayment();
  }
}
