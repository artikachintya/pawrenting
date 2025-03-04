import 'package:flutter/material.dart';

class ChooseTopic extends StatefulWidget {
  final Function(String) onTopicSelected;

  const ChooseTopic({Key? key, required this.onTopicSelected}) : super(key: key);

  @override
  _ChooseTopicState createState() => _ChooseTopicState();
}

class _ChooseTopicState extends State<ChooseTopic> {
  final List<String> items = [
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
  String selectedItem = 'Adoption';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Choose Topic',
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0xff8B68CC).withOpacity(0.6)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        value: selectedItem,
        items: items.map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            )).toList(),
        onChanged: (newValue) {
          if (newValue != null) {
            setState(() {
              selectedItem = newValue;
            });
            widget.onTopicSelected(newValue); // Mengirim data ke parent widget
          }
        },
      ),
    );
  }
}
