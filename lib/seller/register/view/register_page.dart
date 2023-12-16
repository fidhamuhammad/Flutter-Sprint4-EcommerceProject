import 'package:e_commerce_app/seller/register/repository/registorRepo.dart';
import 'package:e_commerce_app/seller/signin/login.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _brandnameController = TextEditingController();
  final TextEditingController _brandaddressController = TextEditingController();
  final TextEditingController _branddescriptionController = TextEditingController();
  final TextEditingController _enterprenournameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobliController = TextEditingController();
  final TextEditingController _email_id_Controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formkey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 206, 224),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 48, 80),
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
      body: 
      SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 30,),
              TextFormField(
                controller: _brandnameController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please fill this field';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Brand name',
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
              SizedBox(height: 10,),
              TextFormField(
                controller: _brandaddressController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please fill this field';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Brand address',
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
              SizedBox(height: 10,),
              TextFormField(
                controller: _branddescriptionController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please fill this field';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Brand description',
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
              SizedBox(height: 10,),
              TextFormField(
                controller: _enterprenournameController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please fill this field';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Enterprenour name',
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
              SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please fill this field';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Address',
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
              SizedBox(height: 10),
              TextFormField(
                controller: _mobliController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please fill this field';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Phonenumber',
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
              SizedBox(height: 10),
              TextFormField(
                controller: _email_id_Controller,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please fill this field';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Email',
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
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please fill this field';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Password',
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
              SizedBox(height: 10),
              TextButton(
               onPressed:  () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage(),));
               },
               child: Text('Already have an account?Click here!',
               style: TextStyle(color: Colors.blue),),
               ),
              SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 58, 145, 207),
                ),
              onPressed: () async {
                if (_formkey.currentState!.validate()){
                  await RegisterRepo().createUser(
                    _brandnameController.text, 
                    _brandaddressController.text, 
                    _branddescriptionController.text, 
                    _enterprenournameController.text, 
                    _addressController.text, 
                    _mobliController.text, 
                    _email_id_Controller.text, 
                    _passwordController.text, 
                    context);
                    _brandnameController.clear(); 
                    _brandaddressController.clear();
                    _branddescriptionController.clear();
                    _enterprenournameController.clear(); 
                    _addressController.clear(); 
                    _mobliController.clear();
                    _email_id_Controller.clear();
                    _passwordController.clear(); 
                Navigator.push(context, MaterialPageRoute(builder:  (context) => Loginpage(),));
                }
              },
              child: Text('Create Account',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              )
               ),
            ],
          ),
        ),
      ),
    );
  }
}