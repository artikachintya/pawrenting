import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Text(
            'Hello',
            style: Theme.of(context).textTheme.headlineMedium
          ),
        )
      ),
    );
  }
}