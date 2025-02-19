import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class chooseTopic extends StatefulWidget {
  @override
  _chooseTopic createState() => _chooseTopic();
}

class _chooseTopic extends State<chooseTopic> {
  List<String> items = [
    'Adoption',
    'Donation',
    'Education',
    'Fun',
    'Health',
    'Information',
    'Lost Pet',
    'Review Product',
    'Tips'
  ];

  // Item yang dipilih
  String? selectedItem = 'Adoption';

  @override
  Widget build(BuildContext context) {
    return Container(
       
        
        child: Container(
          width: 320,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Choose Topic',
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width:1, color: Color(0xff8B68CC).withOpacity(0.6)),
                borderRadius: BorderRadius.circular(10),
              ),
              
            ),
            
            // hint: Text('Select a topic'),
            // Menampilkan nilai yang dipilih
            value: selectedItem,
            
            // Daftar pilihan yang ditampilkan dalam dropdown
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            
            // Fungsi yang dijalankan saat pilihan berubah
            onChanged: (newValue) {
              setState(() {
                selectedItem = newValue;
              });
            },
          ),
        ),
    );
  }
}


