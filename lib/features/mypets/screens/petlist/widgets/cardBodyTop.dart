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
    return SizedBox(
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            // color: Colors.red,
            width: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                  style: const TextStyle(
                    fontFamily: 'AlbertSans',
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    height: 1
                  ),
                ),
                Text(breed,
                  style: const TextStyle(
                    fontFamily: 'AlbertSans',
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    height: 1
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            // color: Colors.red,
            width: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Age',
                  style: TextStyle(
                    fontFamily: 'AlbertSans',
                    fontSize: 11,
                    fontWeight: FontWeight.w300
                  ),
                ),
                Text(age,
                  style: const TextStyle(
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
