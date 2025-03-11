import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/home/controllers/DeliveryController.dart';
import 'package:pawrentingreborn/features/home/controllers/OrderController.dart';
import 'package:pawrentingreborn/features/home/models/deliveryModel.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/AddressCard2.dart';
import 'package:pawrentingreborn/features/profile/widgets/addressCard.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class ChooseDelivery extends StatelessWidget {
  final List<DeliveryModel> deliveryList;
  const ChooseDelivery({super.key, required this.deliveryList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              width: 240,
              height: 50,
              decoration: BoxDecoration(
                  color: TColors.accent,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: TColors.primary,
      appBar: TAppBar2(
          title: 'Delivery Option', subtitle: 'Choose the right one for you'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          height: 500,
          width: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(TImages.paws), fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 13),
                child: Text(
                  'Choose Delivery Service',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return DeliveryChoice(index: index);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: deliveryList.length),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryChoice extends StatelessWidget {
  final int index;
  const DeliveryChoice({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    DeliveryController deliveryController = Get.find();
    OrderController orderController = Get.find();
    return GestureDetector(
      onTap: () {
        deliveryController.selectDelivery(index);
        orderController.updateTotalPrice();
      },
      child: Obx(
        () => Container(
          height: 80,
          decoration: BoxDecoration(
              border: index == deliveryController.selectedIndex.value
                  ? Border.all(color: TColors.accent, width: 1.5)
                  : null,
              color: TColors.gray,
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      deliveryController.deliveryList[index].name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Estimated time arrived: ${deliveryController.getFormattedEta(index)}',
                      style: TextStyle(
                          fontSize: 14,
                          color: TColors.grayFont,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Text(
                  'Rp${deliveryController.deliveryList[index].price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
