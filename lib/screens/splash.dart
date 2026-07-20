import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,

    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          // Logo
          Container(
            height: 130,
            width: 130,
            padding: const EdgeInsets.all(25),

            decoration: BoxDecoration(
              color: const Color(0xFFF3F1FF),
              borderRadius: BorderRadius.circular(30),
            ),

            child: SvgPicture.asset(
              "assets/octagon.svg", // Change if your path is different
              colorFilter: const ColorFilter.mode(
                Color(0xFF6C63FF),
                BlendMode.srcIn,
              ),
            ),
          ),

          const SizedBox(height: 35),

          const Text(
            "PadhLe",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "A College \nResource Repository",
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 50),

          const SizedBox(
            width: 28,
            height: 28,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Color(0xFF6C63FF),
            ),
          ),
        ],
      ),
    ),
  );
}
}