import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
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
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Product Name'),
                  ),
                  TextFormField(
                     decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Product Code'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Product Description'),
                  ),
                  TextFormField(
                       decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Product Stock'),
                  ),
                  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromARGB(255, 119, 172, 237)),
                  onPressed: () {},
                  child: Text(
                    'ADD PRODUCT',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ))
        ],
      ),
      
    );
  }
}