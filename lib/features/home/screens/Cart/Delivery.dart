import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/AddressCard2.dart';
import 'package:pawrentingreborn/features/profile/widgets/addressCard.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class ChooseDelivery extends StatelessWidget {
  const ChooseDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Container(
            width: 240,
            height: 50,
            decoration: BoxDecoration(
                color: TColors.accent, borderRadius: BorderRadius.circular(10)),
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
              DeliveryChoice(
                selected: true,
              ),
              SizedBox(
                height: 10,
              ),
              DeliveryChoice(
                selected: false,
              ),
              SizedBox(
                height: 10,
              ),
              DeliveryChoice(
                selected: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryChoice extends StatelessWidget {
  final bool selected;
  const DeliveryChoice({
    super.key,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          border:
              selected ? Border.all(color: TColors.accent, width: 1.5) : null,
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
                  'Regular',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Estimated time arrived: 31 Feb',
                  style: TextStyle(
                      fontSize: 14,
                      color: TColors.grayFont,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Text(
              'Rp63.000',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
