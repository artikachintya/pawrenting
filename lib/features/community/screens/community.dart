import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TAppBar(onMain: true, onPetDetails: false),
            Container(
              color: Colors.red.withAlpha(100),
              height: 2000,
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    color: Colors.amber,
                    width: 400,
                    height: 50,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.search),
                        Text('Search')
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: 400,
                    height: 50,
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.white,
                          child: const Text('anjay'),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: const Text('tred'),
                        ),
                      ],
                    ),
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
