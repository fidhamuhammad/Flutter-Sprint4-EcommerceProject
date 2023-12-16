import 'package:e_commerce_app/seller/register/register.dart';
import 'package:e_commerce_app/seller/signin/login.dart';
import 'package:flutter/material.dart';

class SellersLaunch extends StatelessWidget {
  const SellersLaunch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,       
        centerTitle: true,
        title: Center(
          child: Text(
            "LakeStore",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,),
          ),
        ),
        // leading: Icon(
        //   Icons.shopping_basket_rounded,
        //   color: Colors.white,
        // ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
              Color(0xFF60ade0),
              Color(0xFF76b8e3),
              Color(0xFF8fc7eb),
              Color(0xFF6076e0),
          ],
           begin: Alignment.bottomRight,
            end: Alignment.topRight          
          )
        ),
        child: Center(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Become a seller', style: TextStyle(color: Colors.white60, fontSize: 50, fontWeight: FontWeight.w400),),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage(),));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person_2_outlined, color: Colors.white), 
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.app_registration_outlined, color: Colors.white), 
                    SizedBox(
                        width: 8.0),
                    Text(
                      'SignUp',
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
