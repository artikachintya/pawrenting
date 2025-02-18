import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class DropdownMenuExample extends StatefulWidget {
  @override
  _DropdownMenuExampleState createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Menu Example'),
      ),
      body: Center(
        child: DropdownButton<String>(
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


