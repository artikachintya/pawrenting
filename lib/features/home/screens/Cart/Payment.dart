import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/home/controllers/OrderController.dart';
import 'package:pawrentingreborn/features/home/controllers/PaymentController.dart';
import 'package:pawrentingreborn/features/home/models/cartItemModel.dart';
import 'package:pawrentingreborn/features/home/models/paymentModel.dart';
import 'package:pawrentingreborn/features/home/screens/Cart/afterpay.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/PriceDetails.dart';
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
                  print(
                      'monyet ${orderController.deliveryController.deliveryList[orderController.deliveryController.selectedIndex.value].name}');

                  !widget.buyNow
                      ? orderController.createOrder()
                      : orderController.createOrderBuyNow(widget.items.first);
                  Get.to(() => AfterPay());
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
}
