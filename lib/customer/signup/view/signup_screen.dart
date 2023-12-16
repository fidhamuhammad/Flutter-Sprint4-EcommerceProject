import 'package:e_commerce_app/customer/login/login.dart';
import 'package:e_commerce_app/customer/signup/repository/signUp_repo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 124, 178),
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
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text(
                'SignUp here!',
                style: TextStyle(
                  color: Colors.black, fontSize: 30, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic,
                ),
              ),
              // LottieBuilder.asset(
              //   'assets/animation/signup.json',
              //   height: 70,
              //   reverse: true,
              //   repeat: true,
              //   fit: BoxFit.cover,
              // ),
              // SizedBox(
              //   height: 10,
              // ),

              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please fill this field';
                    }
                  },
                  decoration: InputDecoration(                     
                    hintText: 'name',
                    prefixIcon:  Icon(Icons.person),
                      contentPadding: EdgeInsets.all(8.0),    
                          labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                ),
              ),
              // SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _addressController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please fill this field';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'address',
                    prefixIcon:  Icon(Icons.home),
                      contentPadding: EdgeInsets.all(8.0),   
                          labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                  ),
                  ),
                ),
              ),
              // SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please fill this field';
                    }
                  },
                  decoration: InputDecoration(
                     hintText: 'phonenumber',
                    prefixIcon:  Icon(Icons.phone),
                      contentPadding: EdgeInsets.all(4.0), 
                          labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                  ),
                  ),
                ),
              ),
              // SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please fill this field';
                    }
                  },
                  decoration: InputDecoration(
                     hintText: 'email',
                    prefixIcon:  Icon(Icons.email),
                      contentPadding: EdgeInsets.all(8.0),  
                          labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                  ),
                  ),
                ),
              ),
              // SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please fill this field';
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'password',
                    prefixIcon:  Icon(Icons.lock),
                      contentPadding: EdgeInsets.all(8.0),  
                          labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                  ),
                  ),
                ),
              ),
              
              SizedBox(height: 25),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 214, 229, 239),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      await SignupRepo().createUser(
                          _nameController.text,
                          _addressController.text,
                          _phoneController.text,
                          _emailController.text,
                          _passwordController.text,
                          context);
                          _nameController.clear();
                          _addressController.clear();
                          _phoneController.clear();
                          _emailController.clear();
                          _passwordController.clear();
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginscreen(),
                          ));
                    }
                  },
               
                child: LottieBuilder.asset(
                'assets/animation/signin.json',
                height: 100,
                reverse: true,
                repeat: true,
                fit: BoxFit.cover,
              ),
                  ),
              
            ],
          ),
        ),
      ),
    );
  }
}
