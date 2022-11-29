import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stock/pages/welcome_page.dart';
import 'package:stock/widgets/app_text_bold.dart';
import 'package:stock/widgets/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //moving to welcome page after some seconds
  @override
  void initState() {
    Timer(const Duration(milliseconds: 2500), () {
      //push replacement used to delete the tsplash page from stack
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const WelcomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/welcome_2.jpg",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: AppTextBold(text: "SureMoney Stock Price Prediction App"),
            )
          ],
        ),
      ),
    );
  }
}
