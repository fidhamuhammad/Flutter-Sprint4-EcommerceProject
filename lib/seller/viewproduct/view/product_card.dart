import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final QueryDocumentSnapshot viewproduct;

  ProductCard({required this.viewproduct});

  @override
  Widget build(BuildContext context) {
    final productName = viewproduct['proname'];
    final productDescription = viewproduct['prodescription'];
    // final productImages = viewproduct['uploadimage'] as List<dynamic>; // Ensure it's a List.
    final productImages = viewproduct['uploadimage']; // Ensure correct type handling
    // Handle single image case
    List<String> images;
    if (productImages is String) {
      images = [productImages]; // Convert single string to list
    } else if (productImages is List) {
      images = List<String>.from(productImages); // Ensure it's a List of Strings
    } else {
      images = [];
    }

    // Debugging prints
    print('Product Name: $productName');
    print('Product Images: $images');
    for (var url in images) {
      print('URL: $url');
    }

    
    // Filter and clean up the URLs
    List<String> validImages = images
        .map((url) => url.replaceAll(RegExp(r'\[|\]'), '')) // Remove brackets
        .where((url) => Uri.tryParse(url)?.hasAbsolutePath ?? false) // Check for valid URL
        .toList();
        

    final productCode = viewproduct['procode'];
    final productStock = viewproduct['prostock'];
    
    // Extract the product price as a double
    final productPrice = double.tryParse(viewproduct['proprice'] ?? '0.0') ?? 0.0;

    return Card(
      color: Color.fromARGB(255, 168, 201, 229),
      
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: <Widget>[
          // Iterate over the list of image URLs
          for (String image in validImages)
            Center(
              
              child: Image.network(
                image,
                height: 90,
                // width: double.infinity,
                fit: BoxFit.cover,
                 errorBuilder: (context, error, stackTrace) {
                    return Text('Image not available'); // Fallback if the image fails to load
                  },
              ),
            ),
            
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'proname: $productName',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('prodescription: $productDescription'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('procode: $productCode'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('prostock: $productStock'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('proprice: \$${productPrice.toStringAsFixed(2)}'),
          ),
        ],
      ),
    );
  }
}




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ProductCard extends StatelessWidget {
//   final QueryDocumentSnapshot viewproduct;

//   ProductCard({required this.viewproduct});

//   @override
//   Widget build(BuildContext context) {
//     final productName = viewproduct['proname'];
//     final productDescription = viewproduct['prodescription'];
//     final productImage = viewproduct['uploadimage'] as List; // Change to match your actual image field name.
//     final productCode = viewproduct['procode'];
//     final productStock = viewproduct['prostock'];
//     final productPrice = viewproduct['proprice'];

//     return Card(
//       elevation: 4,
//       margin: EdgeInsets.all(8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//            // Iterate over the list of image URLs
//           for (String image in productImage)
//           Image.network(
//              image, // Use the product's image URL
//             height: 100,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'proname: $productName',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('prodescription: $productDescription'),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('procode: $productCode'),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('prostock: $productStock'),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('proprice: \$${productPrice.toStringAsFixed(2)}'),
//           ),
//           // You can add more product details as needed
//         ],
//       ),
//     );
//   }
// }







// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ProductCard extends StatelessWidget {
//   const ProductCard({Key? key, required this.viewproduct }):super(key: key);
//   final QueryDocumentSnapshot <Map<String,dynamic>> viewproduct;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 189, 182, 250),
//       body: 
//       Container(
//         height: 200,
//         width: 200,
//         child: Card(       
//             elevation: 4.0,
//             margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//             child:
//              Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//                children: [
//                  Image.network(viewproduct['uploadimage'][0].toString(),height: 80,width: 80,),
//                  Text(viewproduct['proname'].toString()),
//                  Text(viewproduct['prodescription'].toString()),
//                  Text(viewproduct['proprice'].toString()),

//                ],
//              ),
//         ),
//       ),
//     );
//   }
// }