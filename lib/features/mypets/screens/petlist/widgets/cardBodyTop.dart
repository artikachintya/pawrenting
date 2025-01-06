import 'package:flutter/material.dart';

class cardBodyTop extends StatelessWidget {
  const cardBodyTop({
    super.key, required this.name, required this.breed, required this.age,
  });

  final String name;
  final String breed;
  final String age;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // color: Colors.red,
            width: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                  style: TextStyle(
                    fontFamily: 'AlbertSans',
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    height: 1
                  ),
                ),
                Text(breed,
                  style: TextStyle(
                    fontFamily: 'AlbertSans',
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    height: 1
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            // color: Colors.red,
            width: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Age',
                  style: TextStyle(
                    fontFamily: 'AlbertSans',
                    fontSize: 11,
                    fontWeight: FontWeight.w300
                  ),
                ),
                Text(age,
                  style: TextStyle(
                    fontFamily: 'AlbertSans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: .8
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
