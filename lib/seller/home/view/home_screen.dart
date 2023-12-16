import 'package:e_commerce_app/seller/addproduct/addproduct.dart';
import 'package:e_commerce_app/seller/orderview/view_order.dart';
import 'package:e_commerce_app/seller/viewproduct/view/viewproduct.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Image.asset(
                'assets/images/sell.jpeg',
                height: 300,
                width: 300,
              ),
            ),
           
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProductPage(),
                    ),
                  );
                },
                child: Row( // Wrap the text and icon in a Row
                  children: [
                    Icon(Icons.add_circle, color: Colors.white70), // Prefix Icon
                    SizedBox(width: 8), // Spacing between icon and text
                    Text(
                      'Add Product',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color:  Colors.white70,
                      ),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 5, 48, 80),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(12.0),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
            
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ViewProductScreen(),
                    ),
                  );
                },
                child: Row( // Wrap the text and icon in a Row
                  children: [
                    Icon(Icons.visibility, color: Colors.white70), // Prefix Icon
                    SizedBox(width: 8), // Spacing between icon and text
                    Text(
                      'View Product',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 5, 48, 80),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(12.0),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewOrderScreen(),
                    ),
                  );
                },
                child: Row( // Wrap the text and icon in a Row
                  children: [
                    Icon(Icons.list, color: Colors.white70), // Prefix Icon
                    SizedBox(width: 8), // Spacing between icon and text
                    Text(
                      'View Order',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 5, 48, 80),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(12.0),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// view order:
// Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  ViewOrderScreen(),
//                   ));
//                 },
//                 child: Text(
//                   'View Order',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                       color: Colors.white70),
//                 ),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(
//                     Color.fromARGB(255, 5, 48, 80),
//                   ),
//                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                     EdgeInsets.all(12.0),
//                   ),
//                   shape: MaterialStateProperty.all<OutlinedBorder>(
//                       RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   )),
//                 ),
//               ),
//             ),


// view product:
//  Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProductScreen(),));
//                 },
//                 child: Text(
//                   'View Product',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                       color: Colors.white70),
//                 ),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(
//                     Color.fromARGB(255, 5, 48, 80),
//                   ),
//                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                     EdgeInsets.all(12.0),
//                   ),
//                   shape: MaterialStateProperty.all<OutlinedBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

// addproduct:
//  Padding(
//               padding: const EdgeInsets.all(8.0),
              
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AddProductPage(),
//                       ));
//                 },
//                 child: 
//                 Text(
//                   'Add Product',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                       color: Colors.black87),
//                 ),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(
//                     Color.fromARGB(255, 247, 248, 248),
//                   ),
//                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                     EdgeInsets.all(12.0),
//                   ),
//                   shape: MaterialStateProperty.all<OutlinedBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
                  
      
//                 ),
//               ),
              
//             ),