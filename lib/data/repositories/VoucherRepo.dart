import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VoucherRepo extends GetxController{
  final _db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Add a new voucher to the user's existing document in Firestore
  Future<void> addVoucher(String email, String newVoucher) async {
    DocumentReference userRef = _db.collection('users').doc(firebaseAuth.currentUser!.email);
    _db.collection('users').where('email', isEqualTo: email).get().then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        userRef.update({
          'vouchers': FieldValue.arrayUnion([newVoucher])
        }).then((_) {
          print("Voucher added successfully!");
        }).catchError((error) {
          print("Failed to add voucher: $error");
        });
      } else {
        userRef.set({
          'vouchers': [newVoucher]
        }).then((_) {
          print("Voucher added successfully!");
        }).catchError((error) {
          print("Failed to add voucher: $error");
        });
      }
    });

    
  }

}