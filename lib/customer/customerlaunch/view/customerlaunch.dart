import 'package:e_commerce_app/customer/login/login.dart';
import 'package:e_commerce_app/customer/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomerLaunch extends StatelessWidget {
  const CustomerLaunch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
                'Lake Store',
                style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.bold, fontSize: 30, fontStyle: FontStyle.italic),),
                centerTitle: true,
      ),

      body: 
       
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF6076e0),
                  Color(0xFF60ade0),
                  Color(0xFF76b8e3),
                  Color(0xFF8fc7eb)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
                )
            ),
            child: 
            Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Lottie.asset(
                'assets/animation/animation_lmxp1ny4.json',
                height: 400,
                reverse: true,
                repeat: true,
                fit: BoxFit.cover,
              ),
              
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen(),));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 7, 60, 104),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person, color: Colors.white), 
                    SizedBox(
                        width: 8.0),
                    Text(
                      'Login',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                },
                style: ElevatedButton.styleFrom(
                   backgroundColor: const Color.fromARGB(255, 7, 60, 104),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.app_registration_rounded, color: Colors.white), 
                    SizedBox(
                        width: 8.0),
                    Text(
                      'Signup',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              
            ],
                  ),
                ),
          ),
    );
  }
}
