import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/classes/catBreeds.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedBreed = catBreeds.first;
    return const Scaffold(
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