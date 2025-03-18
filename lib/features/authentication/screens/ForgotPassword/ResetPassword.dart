import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/authentication/screens/login2.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  const ResetPassword({super.key, required this.email});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  String message = '';

  void sendPasswordResetEmail() async {
    setState(() {
      isLoading = true;
      message = '';
    });

    try {
      await _auth.sendPasswordResetEmail(email: widget.email);
      setState(() {
        message =
            'A password reset link has been sent to ${widget.email}. Check your email.';
      });
    } catch (e) {
      setState(() {
        message = 'Error: ${e.toString()}';
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    sendPasswordResetEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                CircularProgressIndicator()
              else
                Column(
                  children: [
                    Icon(Icons.email, size: 80, color: TColors.accent),
                    SizedBox(height: 20),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => Get.to(() => Login2()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.accent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          'Back to Login',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
