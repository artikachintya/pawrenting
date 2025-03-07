import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/profile/models/VoucherModel.dart';

class VoucherRepo extends GetxController{
  static VoucherRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Add a new voucher to the user's existing document in Firestore
  // Future<void> addVoucher(String email, String newVoucher) async {
  //   DocumentReference userRef = _db.collection('users').doc(firebaseAuth.currentUser!.email);
  //   _db.collection('users').where('email', isEqualTo: email).get().then((querySnapshot) {
  //     if (querySnapshot.docs.isNotEmpty) {
  //       userRef.update({
  //         'vouchers': FieldValue.arrayUnion([newVoucher])
  //       }).then((_) {
  //         print("Voucher added successfully!");
  //       }).catchError((error) {
  //         print("Failed to add voucher: $error");
  //       });
  //     } else {
  //       userRef.set({
  //         'vouchers': [newVoucher]
  //       }).then((_) {
  //         print("Voucher added successfully!");
  //       }).catchError((error) {
  //         print("Failed to add voucher: $error");
  //       });
  //     }
  //   }); 
  // }
  
  Future<void> createVoucher(VoucherModel voucher) async {
    print('Creating voucher');
    await _db.collection('vouchers').add(voucher.toJson()).then((_) {
      print("Voucher created successfully!");
    }).catchError((error) {
      print("Failed to create voucher: $error");
    }); 
  }

  Future<List<VoucherModel>> getVouchers() async {
    final snapshot = await _db.collection('vouchers').get();
    print("Fetched ${snapshot.docs.length} vouchers"); // Debugging
    return snapshot.docs.map((e) {
      print("Voucher Data: ${e.data()}"); // Debugging
      return VoucherModel.fromSnapshot(e);
    }).toList();
  }

}