import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/controllers/OrderController.dart';
import 'package:pawrentingreborn/features/home/controllers/VoucherController.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class Vouchers extends StatelessWidget {
  const Vouchers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VoucherController());
    OrderController orderController = Get.find();
    return Obx(() => GestureDetector(
          onTap: () {
            controller.toggleVoucher();
            orderController.updateTotalPrice();
          },
          child: Container(
              width: double.maxFinite,
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                  color: !controller.isSelected.value
                      ? Colors.white
                      : Color(0xffECFFF9),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: TColors.accent, width: 1.5)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Free Delivery',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Minimum Order Rp50.000'),
                        ]),
                    ImageIcon(
                      AssetImage(TImages.deliverytruck),
                      color: TColors.accent,
                      size: 32,
                    )
                  ])),
        ));
  }
}
