import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 400,
        height: 120,
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: TColors.gray,
            border: Border.all(color: TColors.lightPurple)),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(left: 14, top: 5),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: TColors.bluePrim, width: 2),
                  borderRadius: BorderRadius.circular(5)),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 20, right: 10, top: 10, bottom: 10),
              child: Image.asset(TImages.braveryCatFood),
            ),
            Column(children: [
              // product name
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Bravery Cat Adult Herring',
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Albert Sans',
                      fontWeight: FontWeight.w600),
                ),
              ),
              // product weight
              Padding(
                padding: EdgeInsets.only(top: 10, right: 130),
                child: Text(
                  '7kg',
                  style: TextStyle(
                      color: TColors.grayPrice,
                      fontSize: 12,
                      fontFamily: 'Alata'),
                ),
              ),
              // product price
              Padding(
                padding: EdgeInsets.only(top: 10, right: 90),
                child: Text(
                  'Rp 80.000',
                  style: TextStyle(fontSize: 12, fontFamily: 'Alata'),
                ),
              )
            ]),
          ],
        ),
      ),
      Positioned(
        child: Row(children: [
          Container(
            child: Image.asset(TImages.removeItem),
            margin: EdgeInsets.only(right: 10),
          ),
          Text('1',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Albert Sans',
                fontWeight: FontWeight.w800
              ),
               
              ),
          Container(
            child: Image.asset(TImages.addItem),
            margin: EdgeInsets.only(left: 10),
          )
        ]),
        top: 85,
        left: 330,
      ),
    ]);
  }
}