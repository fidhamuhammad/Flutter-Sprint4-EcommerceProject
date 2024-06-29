import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../repository/add_cart_repo.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productDataDocIndex});
  final QueryDocumentSnapshot<Map<String, dynamic>> productDataDocIndex;

  @override
  Widget build(BuildContext context) {
    // Extract and clean the image URL
    String imageUrl = productDataDocIndex['uploadimage'].toString();

    // Clean up and validate URL
    imageUrl = imageUrl.replaceAll(RegExp(r'\[|\]'), '').trim();

    bool isValidUrl = Uri.tryParse(imageUrl)?.hasAbsolutePath ?? false;

    // Fallback for invalid URL
    if (!isValidUrl) {
      imageUrl = '';
    }

    // Debug print the cleaned URL
    print('Image URL: $imageUrl');

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
            child: isValidUrl && imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100,
                    errorBuilder: (context, error, stackTrace) {
                      return Text('Image not available');
                    },
                  )
                : Text('No valid image available'), // Handle no valid image
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'product Name : ${productDataDocIndex['proname'].toString()}',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'product Price : ${productDataDocIndex['proprice'].toString()}',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'product Description : ${productDataDocIndex['prodescription'].toString()}',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('product Code : ${productDataDocIndex['procode'].toString()}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'product Stock : ${productDataDocIndex['prostock'].toString()}',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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

















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce_app/customer/productdetails/repository/add_cart_repo.dart';
// import 'package:flutter/material.dart';

// class ProductDetails extends StatelessWidget {
//   const ProductDetails({super.key, required this.productDataDocIndex});
//   final QueryDocumentSnapshot<Map<String, dynamic>> productDataDocIndex;

//   @override
//   Widget build(BuildContext context) {
//    // Extract and clean the image URL
//     String imageUrl = productDataDocIndex['uploadimage'].toString();

//     // Clean up and validate URL
//     imageUrl = imageUrl.replaceAll(RegExp(r'\[|\]'), '').trim();

//     bool isValidUrl = Uri.tryParse(imageUrl)?.hasAbsolutePath ?? false;

//     // Fallback for invalid URL
//     if (!isValidUrl) {
//       imageUrl = '';
//     }
    
//     // Debug print the cleaned URL
//     print('Image URL: $imageUrl');

//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 235, 239, 244),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Color.fromARGB(255, 49, 124, 178),
//         centerTitle: true,
//         title: Text(
//           "LakeStore",
//           style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.w400,
//               fontStyle: FontStyle.italic),
//         ),
//         leading: Icon(
//           Icons.shopping_basket_rounded,
//           color: Colors.white,
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(24.0),
//             // child:
//             // Image.network(
//             //   productDataDocIndex['uploadimage'].toString(),
//             //   fit: BoxFit.fill,
//             //   height: 100,
//             //   width: 100,
//             // ),

//             child: isValidUrl && imageUrl.isNotEmpty
//                 ? Image.network(
//                     imageUrl,
//                     fit: BoxFit.fill,
//                     height: 100,
//                     width: 100,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Text('Image not available');
//                     },
//                   )
//                 : Text('No valid image available'), // Handle no valid image
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'product Name : ${productDataDocIndex['proname'].toString()}',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'product Price : ${productDataDocIndex['proprice'].toString()}',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'product Description : ${productDataDocIndex['prodescription'].toString()}',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//                 'product Code : ${productDataDocIndex['procode'].toString()}'),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'product Stock : ${productDataDocIndex['prostock'].toString()}',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color.fromARGB(255, 49, 124, 178),
//             ),
//             onPressed: () async {
//               await AddCartRepo().addToCart(productDataDocIndex, context);
//               Navigator.pop(context);
//             },
//             child: Text(
//               'add to cart',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
