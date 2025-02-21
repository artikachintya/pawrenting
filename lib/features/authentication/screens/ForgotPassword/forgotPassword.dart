import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/authentication/screens/ForgotPassword/forgotPassword2.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: Container(
        height: 890,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login/wallpaper-login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset('assets/login/circle.png', height: 375),
                  Positioned(
                    top: 70,
                    left: MediaQuery.of(context).size.width / 2 - 150,
                    child: Image.asset(
                      TImages.forgotPass,
                      width: 250,
                    ),
                  ),
                ],
              ),
              Form(
                child: Container(
                  width: 375,
                  height: 350,
                  decoration: BoxDecoration(
                      color: TColors.secondary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              color: TColors.accent),
                        ),
                        Text(
                          'Enter your email address below to reset your password',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: TColors.grayFont,
                              fontFamily: 'Alata'),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            labelText: 'Email',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 7),
                            errorStyle:
                                const TextStyle(height: 0.8, fontSize: 12),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red.shade700),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red.shade700),
                            ),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Email is required' : null,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 300,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.accent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              Get.to(() => ForgotPassword2());
                            },
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
