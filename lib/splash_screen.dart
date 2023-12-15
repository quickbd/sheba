
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sheba/View/default_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds:5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DefaultPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       // color: Colors.blue,
          decoration: BoxDecoration(
            image:DecorationImage(image: AssetImage("/assets/images/bg2.jpg"),fit:BoxFit.cover),

          ),

        child: const Center(
          child: Text('QuickBD', style: TextStyle(
            fontSize: 42.0,
            color: Colors.white60,

          ),
          ),
        ),
      ),
    );
  }
}
