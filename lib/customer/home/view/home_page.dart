import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/customer/cart/view/cart_page.dart';
import 'package:e_commerce_app/customer/home/view/widgets/product_list.dart';
import 'package:e_commerce_app/customer/login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Navigate to the login screen and remove all previous routes
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Loginscreen()),
      (route) => false, // This removes all routes from the stack
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 235, 239, 244),
      backgroundColor: const Color.fromARGB(255, 122, 169, 249),
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
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),

          IconButton(
            icon: Icon(Icons.exit_to_app_rounded, color: Colors.white),
            onPressed: () {
              _logout(context);
            },
          ),
          // PopupMenuButton<String>(
          //   onSelected: (value) {
          //     if (value == 'logout') {
          //       _logout(context);
          //     }
          //   },
          //   itemBuilder: (context) => [
          //     const PopupMenuItem<String>(
          //       value: 'logout',
          //       child: Text('Logout'),
          //     ),
          //   ],
          // ),

          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => CartPage(),
          //         ));
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Icon(
          //       Icons.shopping_cart,
          //       color: Colors.white,
          //     ),
          //   ),
          // )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('addproductdetails')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error : ${snapshot.error}');
          }
          final products = snapshot.data!.docs;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 0,
              childAspectRatio: 0.5,
            ),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductList(productDataDocIndex: products[index]);
            },
          );
        },
      ),
    );
  }
}
