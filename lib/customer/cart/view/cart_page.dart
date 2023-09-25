import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 239, 244),
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
      body:  Center(
                child: Text(
          'welcome',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 60,fontStyle: FontStyle.italic),
        )),
      
    );
  }
}