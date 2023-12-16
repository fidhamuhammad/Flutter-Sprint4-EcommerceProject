import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/customer/productdetails/details.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key, required this.productDataDocIndex}) :super(key: key);
  final QueryDocumentSnapshot<Map<String, dynamic>> productDataDocIndex;

  @override
  Widget build(BuildContext context) {

    print(productDataDocIndex['uploadimage']);
    return Scaffold(
      body: InkWell(
        onTap: () {
           Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetails(productDataDocIndex: productDataDocIndex),
              ));
        },
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            child: Card(
              color: Colors.white10,
              margin: EdgeInsets.all(16.0),
              elevation: 4.0,
              child: Column(
                
                children: [
                  Expanded(
                    
                    child: Image.network(
                      productDataDocIndex['uploadimage'].toString(),
                      fit: BoxFit.fill,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                  Text(productDataDocIndex['proname'].toString()),
                  Text(productDataDocIndex['proprice'].toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}