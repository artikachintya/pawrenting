import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class TAppBar2 extends StatelessWidget {
  const TAppBar2({
    super.key, required this.title, required this.subtitle,
  });

  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return TAppBar(
      onPetDetails: false,
      onMain: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelMedium,
          )
        ],
      )
    );
  }
}