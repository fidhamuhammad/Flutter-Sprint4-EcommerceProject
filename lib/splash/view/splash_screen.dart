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
              builder: (context) =>  LaunchScreen(),
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
      backgroundColor: Color.fromARGB(255, 151, 172, 236),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.shopping_basket_rounded,
            //   size: 100.0,
            //   color: Colors.white60                
            // ),
            Text('LakeStore',
            style: TextStyle(
              color: Colors.white38, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 50
              ),
            ),
          ],
        ),
      ),
    );
  }
}