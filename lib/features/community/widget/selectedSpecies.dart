import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SpeciesSelection(),
  ));
}

class SpeciesSelection extends StatefulWidget {
  @override
  _SpeciesSelectionState createState() => _SpeciesSelectionState();
}

class _SpeciesSelectionState extends State<SpeciesSelection> {
  // Variabel untuk menyimpan spesies yang dipilih
  String? selectedSpecies = 'Cat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Tombol "Cat"
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSpecies = 'Cat';
                    });
                  },
                  child: Container(
                    width: 140,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: selectedSpecies == 'Cat'
                          ? Color(0xff4749AE).withOpacity(0.7)
                          : Color(0xff9E9E9E).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: selectedSpecies == 'Cat'
                        ? Color(0xff4749AE)
                        : Colors.transparent
                      )
                    ),
                    child: Text(
                      'Cat',
                      style: TextStyle(
                        color: selectedSpecies == 'Cat'
                            ? Colors.white
                            : Color(0xff535050),
                        fontSize: 16,
                        fontFamily: 'alata'
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),

                // Tombol "Dog"
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSpecies = 'Dog';
                    });
                  },
                  child: Container(
                    width: 140,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: selectedSpecies == 'Dog'
                           ? Color(0xff4749AE).withOpacity(0.7)
                          : Color(0xff9E9E9E).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                     border: Border.all(
                        color: selectedSpecies == 'Dog'
                        ? Color(0xff4749AE)
                        : Colors.transparent
                      )
                    ),
                    child: Text(
                      'Dog',
                      style: TextStyle(
                        color: selectedSpecies == 'Dog'
                            ? Colors.white
                            : Color(0xff535050),
                        fontSize: 16,
                        fontFamily: 'alata'
                      ),
                    ),
                  ),
                ),
              ],
            
          ),
          ]
            
        ),
      ),
    );
  }
}

