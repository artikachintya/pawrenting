import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../navigationMenu.dart';

class Login2 extends StatelessWidget {
  const Login2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login/wallpaper-login.png'),
              fit: BoxFit.cover,
            ),
          ), // Light purple background
          child: Column(
            children: [
              // Header Section
              SizedBox(
                height: 300,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 30),
                    //   child: Image.asset(
                    //     'assets/login/tulang-anjing.png',
                    //     height: 50,
                    //     width: 50,
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Image.asset(
                        'assets/login/tulang-anjing.png',
                        height: 200,
                        width: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Spacer(),
                    // Dog food image on top-right
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Image.asset(
                        'assets/login/makanan-anjing.png',
                        height: 323,
                        width: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              // Welcome Text Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                      ),
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'AlbertSans',
                          color: Color(0xFF4749AE),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                          height: 0.8,
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'AlbertSans',
                          color: Color(0xFF4749AE),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Login to your account',
                        style: TextStyle(
                          height: 0.6,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF686767),
                          fontFamily: 'Alata',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Login Form Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: _LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: const Icon(Icons.visibility),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password ?',
                style: TextStyle(
                  color: Color(0xFF4749AE),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.to(const NavigationMenu());
              },
              style: _elevatedButtonStyle(),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don’t have an account ?"),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Color(0xFF4749AE),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ButtonStyle _elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF7367F0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
    );
  }
}
