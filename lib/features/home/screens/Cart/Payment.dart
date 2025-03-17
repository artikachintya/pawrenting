import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/data/repositories/UserRepo.dart';
import 'package:pawrentingreborn/features/authentication/model/UserModel.dart';
import 'package:pawrentingreborn/features/home/controllers/OrderController.dart';
import 'package:pawrentingreborn/features/home/controllers/PaymentController.dart';
import 'package:pawrentingreborn/features/home/models/cartItemModel.dart';
import 'package:pawrentingreborn/features/home/models/paymentModel.dart';
import 'package:pawrentingreborn/features/home/screens/Cart/afterpay.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/PriceDetails.dart';
import 'package:pawrentingreborn/features/profile/controllers/editDataController.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';

class Payment extends StatefulWidget {
  final bool buyNow;
  final List<CartItemModel> items;
  const Payment({super.key, required this.buyNow, required this.items});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? selectedPayment;
  String? expandedPayment;
  @override
  Widget build(BuildContext context) {
    print(widget.items.first.productModel.salePrice);
    List<Paymentmodel> payments = Paymentmodel.getpayment();
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const TAppBar2(title: 'Payment', subtitle: 'Choose your payment'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(child: _paymentMethod(payments)),
            const SizedBox(height: 20),
            PriceDetails(
              buyNow: widget.buyNow,
              items: widget.items,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  /// **Widget untuk List Metode Pembayaran**
  Widget _paymentMethod(List<Paymentmodel> payments) {
    PaymentController paymentController = Get.find();
    return ListView.separated(
      itemBuilder: (context, index) {
        bool isSelected = selectedPayment == payments[index].name;
        bool isExpanded = expandedPayment == payments[index].name;

        return GestureDetector(
          onTap: () {
            paymentController.selectedIndex = index;
            setState(() {
              selectedPayment = payments[index].name;
              expandedPayment = isExpanded ? null : payments[index].name;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  isSelected ? TColors.primary : Colors.white.withOpacity(0.5),
              border: Border.all(
                color: isSelected
                    ? TColors.purplebutton
                    : Colors.white.withOpacity(0.25),
                width: 1.5,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      Radio<String>(
                        value: payments[index].name,
                        groupValue: selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            selectedPayment = value;
                            expandedPayment = isExpanded ? null : value;
                          });
                        },
                        activeColor: Color(0xFF692ED5),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        payments[index].name,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),

                // Bagian langkah-langkah pembayaran
                if (isExpanded) _paymentSteps(payments[index].name, index),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: payments.length,
    );
  }

  /// **Widget untuk Menampilkan Langkah Pembayaran**
  Widget _paymentSteps(String paymentName, int index) {
    List<Paymentmodel> steps = Paymentmodel.getpayment();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Steps:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            ...steps[index].steps.map((step) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text("• $step"),
                )),
          ],
        ),
      ),
    );
  }

  /// **Bottom Navigation Bar untuk Tombol Bayar**
  Widget _bottomBar() {
    OrderController orderController = Get.find();
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  const Text(
                    'Total Price: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    !widget.buyNow
                        ? 'Rp${orderController.totalPrice.value.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}'
                        : 'Rp${(widget.items.first.quantity.value * widget.items.first.productModel.salePrice + orderController.deliveryPrice.value + 1000).toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: TColors.accent),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (selectedPayment == null) {
                  Get.snackbar(
                    "Error",
                    "Please select a payment method",
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                  );
                } else {
                  _showPasswordVerification();
                }
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: TColors.accent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    'Pay',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPasswordVerification() async {
    TextEditingController passwordController = TextEditingController();
    OrderController orderController = Get.find();
    final userRepo = UserRepo.instance;
    final _auth = FirebaseAuth.instance;
    UserModel? user =
        await userRepo.fetchUserByEmail(_auth.currentUser!.email!);
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Enter Password",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.redAccent, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (passwordController.text == user!.password) {
                      widget.buyNow
                          ? orderController
                              .createOrderBuyNow(widget.items.first)
                          : orderController.createOrder();
                      Get.to(() => AfterPay());
                    } else {
                      Get.snackbar("Error", "Incorrect password!",
                          backgroundColor: Colors.redAccent,
                          colorText: Colors.white);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.accent,
                  ),
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
