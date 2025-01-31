import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/addPet4.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/classes/catBreeds.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedBreed = catBreeds.first;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TAppBar(onMain: true, onPetDetails: false),
            Text('Ini Home')
          ],
        ),
      ),
    );
  }
}