import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class cardHeader extends StatelessWidget {
  const cardHeader({
    super.key,
    required this.isCat,
  });

  final bool isCat;

  @override
  Widget build(BuildContext context) {
    return Positioned(
            child: SizedBox(
    height: 45,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                Image(image: AssetImage(TImages.pawrentingLogo), width: 130, color: TColors.lightgreen,),
                Text(
                  'Kartu Tanda Peliharaan',
                  style: TextStyle(
                    fontFamily: 'AlbertSans',
                    fontSize: 10,
                    color: TColors.lightgreen
                  )
                )
              ]
            )
          ),
          ImageIcon(AssetImage(isCat? TImages.catIcon : TImages.dogIcon), size: 28, color: TColors.lightgreen,),
        ],
      ),
    ),
            ),
            );
  }
}
