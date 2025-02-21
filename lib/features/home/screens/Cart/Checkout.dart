import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: TAppBar2(title: 'Order Details', subtitle: 'Check your order'),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                child: Row(
                  children: [
                    Text(
                      'Total Price: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Rp384.000',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: TColors.accent),
                    )
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: TColors.accent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Choose Payment',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'AlbertSans',
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/login/wallpaper-login.png'))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
            child: Center(
              child: Column(
                children: [
                  AddressCard(),
                  SizedBox(
                    height: 10,
                  ),
                  DeliveryCard(),
                  SizedBox(
                    height: 10,
                  ),
                  COItem(),
                  SizedBox(
                    height: 10,
                  ),
                  VoucherCard(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: TColors.gray,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Details',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w900),
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
                                  fontWeight: FontWeight.bold,
                                  color: TColors.grayFont),
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
                                  fontWeight: FontWeight.bold,
                                  color: TColors.grayFont),
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
                                  fontWeight: FontWeight.bold,
                                  color: TColors.grayFont),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: 60,
      decoration: BoxDecoration(
          // border: Border.all(color: TColors.accent, width: 0.8),
          borderRadius: BorderRadius.circular(10),
          color: TColors.gray),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(TImages.truck),
            color: TColors.accent,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Regular',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp63.000',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Change',
            style: TextStyle(
                fontFamily: 'Alata', fontWeight: FontWeight.w900, fontSize: 12),
          )
        ],
      ),
    );
  }
}

class VoucherCard extends StatelessWidget {
  const VoucherCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: 60,
      decoration: BoxDecoration(
          // border: Border.all(color: TColors.accent, width: 0.8),
          borderRadius: BorderRadius.circular(10),
          color: TColors.gray),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(TImages.voucher2),
            color: TColors.accent,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3 available vouchers',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ImageIcon(
            AssetImage(TImages.arrowForwardIcon),
            size: 12,
          )
        ],
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: 80,
      decoration: BoxDecoration(
          // border: Border.all(color: TColors.accent, width: 0.8),
          borderRadius: BorderRadius.circular(10),
          color: TColors.gray),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(TImages.locationIcon),
            color: TColors.accent,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Home',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rumah Talenta BCA, Jalan Pakuan No.3, Sumur Batu, Bogor, Babakan Madang, Anjay mabarrrrrr',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Change',
            style: TextStyle(
                fontFamily: 'Alata', fontWeight: FontWeight.w900, fontSize: 12),
          )
        ],
      ),
    );
  }
}

class COItem extends StatelessWidget {
  const COItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
          // border: Border.all(width: 0.8, color: TColors.accent),
          color: TColors.gray,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Image.asset(TImages.catFood),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rawrawr Beef & Mackerel Freeze Dried Raw Diet',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '7 kg',
                    style: TextStyle(
                        fontFamily: 'Alata',
                        color: TColors.grayFont,
                        fontSize: 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp80.000',
                        style: TextStyle(
                            fontFamily: 'Alata',
                            color: Colors.black,
                            fontSize: 14),
                      ),
                      Text(
                        'x 1',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
