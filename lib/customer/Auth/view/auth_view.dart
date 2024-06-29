import 'package:e_commerce_app/customer/home/home.dart';
import 'package:e_commerce_app/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../login/view/login_screen.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({super.key});

  Future<bool> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data == true) {
          return const Loginscreen();
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}