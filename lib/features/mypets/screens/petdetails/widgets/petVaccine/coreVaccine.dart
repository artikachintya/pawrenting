import 'package:flutter/material.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petVaccine/vaccineList.dart';

class CoreVaccine extends StatelessWidget {
  const CoreVaccine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    'Core Vaccine', 
                    style: TextStyle( 
                    fontSize: 20,
                    fontFamily: 'Alata',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  )
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          GridView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          mainAxisExtent: 90
          ),
          itemBuilder: (_, index) => VaccineList(name: 'Rabies Virus', taken: true, date: '20 June 2024',) ,
        )
      ],
    );
  }
}