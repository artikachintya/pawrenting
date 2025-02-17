import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/authentication/screens/login2.dart';
import 'package:pawrentingreborn/features/authentication/screens/signup.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 890,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login/wallpaper-login.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 65, right: 50),
                      child: Container(
                        child: Text(
                          'Simplify\nPet Parenting\nWith Us',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff4749AE),
                              height: 1.2),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Container(
                        child: Text(
                          'from daily care to special moments',
                          style: TextStyle(
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                              color: Color(0xff686767),
                              height: 1.2),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: 450,
                          child: Image.asset(
                            'assets/login/circle.png',
                            height: 200,
                            width: 150,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 50,
                          child: Container(
                            width: 300,
                            height: 350,
                            child: Image.asset(
                              'assets/login/anjing-kucing.png',
                              height: 200,
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 360,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff6D52D7),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(31),
                          ),
                        ),
                        onPressed: () {
                          Get.to(()=>Login2());
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: 360,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(31),
                          ),
                        ),
                        onPressed: () {
                          Get.to(()=>Signup());
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(0xff6D52D7),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
