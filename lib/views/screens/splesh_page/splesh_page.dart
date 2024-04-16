import 'dart:async';
import 'package:d_mart_bill/utils/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(
          context,
          MyRoutes.homePage,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff006DA4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/image/d_mart.jpg'),
          ),
          SizedBox(height: 20),
          CircularProgressIndicator(color: Color.fromARGB(190, 97, 53, 254)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Shopping',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
