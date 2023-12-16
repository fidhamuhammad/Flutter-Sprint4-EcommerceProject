import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/seller/viewproduct/productview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewProductScreen extends StatelessWidget {
  ViewProductScreen({Key? key}) : super(key: key);

  final _auth = FirebaseAuth.instance;
  final _taskRef = FirebaseFirestore.instance.collection('addproductdetails');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
      backgroundColor: Colors.transparent,
        title: Text('Your Products List'),
      ),
      body: Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
              Color(0xFF60ade0),
              Color(0xFF6076e0),
              Color(0xFF8fc7eb),
              Color(0xFF76b8e3),

            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight
            ),
          ),
        child: StreamBuilder(
          stream: _taskRef
              .where('userid', isEqualTo: _auth.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final productview = snapshot.data!.docs;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemCount: productview.length,
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    child: ProductCard(viewproduct: productview[index]));
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class ViewProductScreen extends StatefulWidget {
//   final String productId;

//   ViewProductScreen({required this.productId});

//   @override
//   _ViewProductPageState createState() => _ViewProductPageState();
// }

// class _ViewProductPageState extends State<ViewProductScreen> {
//   late Future<DocumentSnapshot<Map<String, dynamic>>> productData;
//   List<String> productImages = [];

//   @override
//   void initState() {
//     super.initState();
//     // Fetch product details from Firestore using the product ID.
//     productData = FirebaseFirestore.instance
//         .collection('addproductdetails')
//         .doc(widget.productId)
//         .get();

//     // Fetch product images from Firebase Storage using the product ID.
//     _fetchProductImages();
//   }

//   Future<void> _fetchProductImages() async {
//   // Initialize a List to store download URLs.
//   List<String> downloadUrls = [];

//   // Get a reference to the product's images in Firebase Storage.
//   Reference productImagesRef = FirebaseStorage.instance.ref().child('upload_image/${widget.productId}');

//   try {
//     // List all the files in the directory.
//     ListResult result = await productImagesRef.list();

//     for (var item in result.items) {
//       String downloadUrl = await item.getDownloadURL();
//       downloadUrls.add(downloadUrl);
//     }

//     setState(() {
//       productImages = downloadUrls;
//     });
//   } catch (e) {
//     // Handle any potential errors here.
//     print('Error fetching product images: $e');
//   }
// }


//   // Future<void> _fetchProductImages() async {
//   //   // Initialize a List to store download URLs.
//   //   List<String> downloadUrls = [];

//   //   // Get a reference to the product's images in Firebase Storage.
//   //   Reference productImagesRef = FirebaseStorage.instance.ref().child('upload_image/${widget.productId}');

//   //   // List all the files in the directory.
//   //   ListResult result = await productImagesRef.list();

//   //   for (var item in result.items) {
//   //     String downloadUrl = await item.getDownloadURL();
//   //     downloadUrls.add(downloadUrl);
//   //   }

//   //   setState(() {
//   //     productImages = downloadUrls;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Details'),
//       ),
//       body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//         future: productData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (!snapshot.hasData || snapshot.data!.data() == null) {
//             return Center(child: Text('Product not found.'));
//           }

//           final productDetails = snapshot.data!.data()!;
//           final productName = productDetails['proname'];
//           final productCode = productDetails['procode'];
//           final productDescription = productDetails['prodescription'];
//           final productStock = productDetails['prostock'];
//           final productPrice = productDetails['proprice'];

//           return ListView(
//             padding: EdgeInsets.all(16),
//             children: [
//               Text(
//                 'Product Name: $productName',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Text('Product Code: $productCode'),
//               Text('Product Description: $productDescription'),
//               Text('Product Stock: $productStock'),
//               Text('Product Price: \$${productPrice.toStringAsFixed(2)}'),
//               SizedBox(height: 16),
//               Text(
//                 'Product Images:',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               // Display product images here
//               for (String imageUrl in productImages)
//                 Image.network(imageUrl, height: 150),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class ViewProductScreen extends StatefulWidget {
//   final String productId;

//   ViewProductScreen({required this.productId});

//   @override
//   _ViewProductPageState createState() => _ViewProductPageState();
// }

// class _ViewProductPageState extends State<ViewProductScreen> {
//   late Future<DocumentSnapshot<Map<String, dynamic>>> productData;
//   List<String> productImages = [];

//   @override
//   void initState() {
//     super.initState();
//     // Fetch product details from Firestore using the product ID.
//     productData = FirebaseFirestore.instance
//         .collection('addproductdetails')
//         .doc(widget.productId)
//         .get();

//     // Fetch product images from Firebase Storage using the product ID.
//     _fetchProductImages();
//   }

 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Details'),
//       ),
//       body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//         future: productData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (!snapshot.hasData || snapshot.data!.data() == null) {
//             return Center(child: Text('Product not found.'));
//           }

//           final productDetails = snapshot.data!.data()!;
//           final productName = productDetails['proname'];
//           final productCode = productDetails['procode'];
//           final productDescription = productDetails['prodescription'];
//           final productStock = productDetails['prostock'];
//           final productPrice = productDetails['proprice'];

//           return ListView(
//             padding: EdgeInsets.all(16),
//             children: [
//               Text(
//                 'Product Name: $productName',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Text('Product Code: $productCode'),
//               Text('Product Description: $productDescription'),
//               Text('Product Stock: $productStock'),
//               Text('Product Price: \$${productPrice.toStringAsFixed(2)}'),
//               SizedBox(height: 16),
//               Text(
//                 'Product Images:',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               // Display product images here
//               for (String imageUrl in productImages)
//                 Image.network(imageUrl, height: 150),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// Future<void> _fetchProductImages() async {
//     // Initialize a List to store download URLs.
//     List<String> downloadUrls = [];

//     // Get a reference to the product's images in Firebase Storage.
//     Reference productImagesRef = FirebaseStorage.instance.ref().child('upload_image/${widget.productId}');

//     // List all the files in the directory.
//     ListResult result = await productImagesRef.list();

//     for (var item in result.items) {
//       String downloadUrl = await item.getDownloadURL();
//       downloadUrls.add(downloadUrl);
//     }

//     setState(() {
//       productImages = downloadUrls;
//     });
//   }






//  Future<void> _fetchProductImages() async {
//     final List<String> images = await FirebaseStorage.instance
//         .ref()
//         .child('upload_image')
//         .listAll();

//     for (final imageRef in images) {
//       final imageUrl = await imageRef.getDownloadURL();
//       productImages.add(imageUrl);
//     }

//     setState(() {});
//   }









// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce_app/seller/viewproduct/productview.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class ViewProductScreen extends StatelessWidget {
//   ViewProductScreen({super.key});

//   final _auth = FirebaseAuth.instance;
//   final _taskRef = FirebaseFirestore.instance.collection('viewproductcollection');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: _taskRef
//             .where('userid', isEqualTo: _auth.currentUser!.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final productview = snapshot.data!.docs;
//             return GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 20,
//                 childAspectRatio: 0.7,
//               ),
//               itemCount: productview.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ProductCard(viewproduct: productview[index]);
//               },
//             );
//           }else{
//            return Center(
//             child: CircularProgressIndicator()
//             );
//           }
//         },
//       ),
//     );
//   }
// }