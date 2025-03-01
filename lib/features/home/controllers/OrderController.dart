import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pawrentingreborn/data/repositories/OrderRepo.dart';
import 'package:pawrentingreborn/features/home/controllers/CartController.dart';
import 'package:pawrentingreborn/features/home/controllers/DeliveryController.dart';
import 'package:pawrentingreborn/features/home/models/orderModel.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();
  CartController cartController = Get.find();
  DeliveryController deliveryController = Get.find();
  final orderRepo = OrderRepo.instance;
  final _auth = FirebaseAuth.instance;
  final List<OrderModel> orderList = <OrderModel>[];
  final String payment = '';
  RxDouble deliveryPrice = 0.0.obs;
  RxDouble totalPrice = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    updateTotalPrice();
    super.onInit();
  }

  void updateTotalPrice() {
    deliveryPrice.value = deliveryController
        .deliveryList[deliveryController.selectedIndex.value].price;
    totalPrice.value = cartController.totalCartPrice.value +
        deliveryController
            .deliveryList[deliveryController.selectedIndex.value].price +
        1000;
  }

  void fetchUserOrders() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final orders = await orderRepo.getOrdersForUser(_auth.currentUser!.uid);
        orderList.assignAll(orders);
      }
    } catch (e) {
      print("Failed to fetch user orders: $e");
    }
  }

  // OrderModel createOrder() {
  //   CartController cartController = Get.find();
  //   final uid = _auth.currentUser!.uid;
  //   final random =
  //       DateTime.now().millisecondsSinceEpoch.toString().substring(8);
  //   final id = '$uid-$random';
  //   final items = cartController.cartItems.value;
  //   final date = DateTime.now();
  //   final status = 'In Delivery';
  //   final totalPrice = cartController.totalCartPrice;
  //   final payment = 'unpaid';
  //   final location = 'default location';

  //   OrderModel order = OrderModel(
  //     id: id,
  //     uid: uid,
  //     items: items,
  //     date: date,
  //     status: status,
  //     totalPrice: totalPrice,
  //     payment: payment,
  //     location: location,
  //   );

  //   return order;
  // }
}
