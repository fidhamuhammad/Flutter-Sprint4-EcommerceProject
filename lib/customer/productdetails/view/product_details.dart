import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/customer/productdetails/repository/add_cart_repo.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productDataDocIndex});
  final QueryDocumentSnapshot<Map<String, dynamic>> productDataDocIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 239, 244),
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child:
            Image.network(
              productDataDocIndex['uploadimage'].toString(),
              fit: BoxFit.fill,
              height: 100,
              width: 100,
            ),
            
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'product Name : ${productDataDocIndex['proname'].toString()}',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'product Price : ${productDataDocIndex['proprice'].toString()}',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'product Description : ${productDataDocIndex['prodescription'].toString()}',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'product Code : ${productDataDocIndex['procode'].toString()}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'product Stock : ${productDataDocIndex['prostock'].toString()}',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 49, 124, 178),
            ),
            onPressed: () async {
              await AddCartRepo().addToCart(productDataDocIndex, context);
              Navigator.pop(context);
            },
            child: Text(
              'add to cart',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
