
import 'package:flutter/material.dart';

class searchbar extends StatelessWidget {
  
  const searchbar({
    super.key, required this.title
  });

  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Container( 
      width: 500,
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xFFF8F6FD),
        borderRadius:BorderRadius.all(
          Radius.circular(15)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 10,),
            Text('Search "how to play with cat"', 
            style: TextStyle(
              fontFamily: 'alata',
              fontSize: 16
              
            )),
            
            
          ],
        ),
      ),
    );
  }
}

