import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_commerce_app/launch/launch.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changeScreen() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.push(
            this.context,
            MaterialPageRoute(
              builder: (context) => LaunchScreen(),
            ));
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6076e0),
              Color(0xFF60ade0),
              Color(0xFF76b8e3),
              Color(0xFF8fc7eb)
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 60.0,
                    fontFamily: 'Canterbury',
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 201, 228, 250)
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText('LakeStore'),                  
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
              // Icon(
              //   Icons.shopping_basket_rounded,
              //   size: 100.0,
              //   color: Colors.white60
              // ),
              // Text('LakeStore',
              // style: TextStyle(
              //   color: Colors.white38, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 50
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
