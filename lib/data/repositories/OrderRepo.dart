import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pawrentingreborn/features/home/models/orderModel.dart';

class OrderRepo extends GetxController {
  static OrderRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createOrder(OrderModel order) {
    print('create order');
    _db.collection('orders').add(order.toJson());
  }

  Future<List<OrderModel>> getOrdersForUser(String userId) async {
    final snapshot =
        await _db.collection('orders').where('userId', isEqualTo: userId).get();
    // print(
    //     "Fetched ${snapshot.docs.length} orders for user $userId"); // Debugging
    return snapshot.docs.map((e) {
      // print("Order Data: ${e.data()}"); // Debugging
      return OrderModel.fromSnapshot(e);
    }).toList();
  }
}
