import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/authentication/screens/ForgotPassword/forgotPassword.dart';
import 'package:pawrentingreborn/features/authentication/screens/signup.dart';
import 'package:pawrentingreborn/features/home/screens/home.dart';

import '../../../navigationMenu.dart';

class Login2 extends StatelessWidget {
  Login2({super.key});

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
          ),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'AlbertSans',
                          color: Color(0xFF4749AE),
                        ),
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
              Padding(
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

class _LoginForm extends StatefulWidget {
  _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;
  String? _errorMessage;

  Future<void> _login() async {
    setState(() {
      _errorMessage = null;
    });

    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        print('Successfully Login');
        Get.to(() => Home());
      } on FirebaseAuthException catch (e) {
        setState(() {
          if (e.code == 'user-not-found') {
            _errorMessage = 'Email not found!';
          } else if (e.code == 'wrong-password') {
            _errorMessage = 'Wrong Password';
          } else if (e.code == 'too-many-requests') {
            _errorMessage =
                'Too many failed attempts. Please try again later!';
          } else {
            _errorMessage = 'Wrong username or Password';
          }
        });
      }
    }
  }

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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: 'Email',
              ),
              validator: (value) => value!.isEmpty ? 'Email is required' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: _isObscure,
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: 'Password',
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Password is required' : null,
            ),
            if (_errorMessage != null) // Tampilkan error jika ada
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.to(() => ForgotPassword());
                },
                child: const Text(
                  'Forgot Password ?',
                  style: TextStyle(
                    color: Color(0xFF4749AE),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await _login();
                },
                style: _elevatedButtonStyle(),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.white),
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
                    onPressed: () {
                      Get.to(() => Signup());
                    },
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
      ),
    );
  }

  ButtonStyle _elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF7367F0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
    );
  }
}
