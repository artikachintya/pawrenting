
import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: TColors.gray, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Details',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product Subtotal',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.grayFont),
              ),
              Text(
                'Rp320.000',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: TColors.grayFont),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Subtotal',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.grayFont),
              ),
              Text(
                'Rp63.000',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: TColors.grayFont),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Admin Fee',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.grayFont),
              ),
              Text(
                'Rp1.000',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: TColors.grayFont),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rp384.000',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: TColors.accent),
              )
            ],
          ),
        ],
      ),
    );
  }
}