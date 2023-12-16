import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/seller/home/view/home_screen.dart';
import 'package:e_commerce_app/seller/register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 191, 206, 224),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 5, 48, 80),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "LakeStore",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic),
        ),
        leading: Icon(
          Icons.shopping_basket_rounded,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
              Color(0xFF6076e0),
              Color(0xFF60ade0),
              Color(0xFF76b8e3),
              Color(0xFF8fc7eb)
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height: 150,),
                 LottieBuilder.asset(
                  'assets/animation/sellerlogin.json',
                  height: 200,
                  reverse: true,
                  repeat: true,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(24.0),
                  child: TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'plase fill this field';
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: 'username',
                      hintStyle: TextStyle(color: Colors.black54),
                      contentPadding: EdgeInsets.all(10.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(24.0),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'plase fill this field';
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'password',
                      hintStyle: TextStyle(color: Colors.black54),
                      contentPadding: EdgeInsets.all(10.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 58, 145, 207),
                    ),
                    onPressed: () async {
                      final sellerRef = FirebaseFirestore.instance.collection('sellercollection').where('email',isEqualTo: _usernameController.text).get();
                      final result = await sellerRef;
                      if (result.docs.isNotEmpty) {
                              try {
                        final _auth = FirebaseAuth.instance;
                        final userRef = await _auth.signInWithEmailAndPassword(
                            email: _usernameController.text,
                            password: _passwordController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('inavalid user name or password, \n $e')));
                      }
                      }
                      else {
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(' seller does not exist!')));
                      }
                
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    )),
                Text(
                  'not registerd?',
                  style:
                      TextStyle(color: const Color.fromARGB(255, 39, 112, 172)),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 58, 145, 207),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ));
                    },
                    child: Text(
                      'Create an Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
