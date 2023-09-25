import 'package:e_commerce_app/customer/cart/view/cart_page.dart';
import 'package:e_commerce_app/customer/productdetails/view/product_details.dart';
import 'package:e_commerce_app/widgets/cart_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body:
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(),));
              },
           child: CardWidget()),           

        //    

        );
  }
}
