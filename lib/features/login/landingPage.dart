import 'package:flutter/material.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login/wallpaper-login.png'),
                fit: BoxFit.cover,
              ),
            ),

            child: Column(
              children: [
                Container(
                  
                ),
              ],
            ), 
          )
        ],
      ),
    );
  }
}
