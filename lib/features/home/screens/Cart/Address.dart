import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/AddressCard2.dart';
import 'package:pawrentingreborn/features/profile/widgets/addressCard.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class ChooseAddress extends StatelessWidget {
  const ChooseAddress({super.key});

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
      floatingActionButton: SizedBox(
        width: 90,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: TColors.accent,
          foregroundColor: Colors.white,
          child: Text('+ Add',
              style: TextStyle(
                  fontSize: 12, fontFamily: 'Alata', color: Colors.white)),
        ),
      ),
      backgroundColor: TColors.primary,
      appBar:
          TAppBar2(title: 'Choose Address', subtitle: 'Make sure it\'s right!'),
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
                  'Address',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              AddressCard2(
                labelAddress: 'Mansion',
                receiverName: 'Anjay',
                addressDetail: 'Aawokawokaowkoawkoawk',
                phoneNumber: '085377214287',
                selected: true,
              ),
              SizedBox(
                height: 10,
              ),
              AddressCard2(
                labelAddress: 'Mansion',
                receiverName: 'Anjay',
                addressDetail: 'Aawokawokaowkoawkoawk',
                phoneNumber: '085377214287',
                selected: false,
              ),
              SizedBox(
                height: 10,
              ),
              AddressCard2(
                labelAddress: 'Mansion',
                receiverName: 'Anjay',
                addressDetail: 'Aawokawokaowkoawkoawk',
                phoneNumber: '085377214287',
                selected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
