import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

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
      body: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.android), // Icon or image
              title: Text('Card Title'), // Title
              subtitle: Text('Card Subtitle'), // Subtitle
            ),
             Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Card Content Goes Here',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
          ],
        ),
      ),
    );
  }
}


// body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Image.asset(
//               'assets/images/bag.jpeg',
//               height: 200,
//               width: 200,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'code',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'price',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//           ),
//           ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color.fromARGB(255, 49, 124, 178),
//               ),
//               onPressed: () {},
//               child: Text(
//                 'add to cart',
//                 style:
//                     TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//               ))
//         ],
//       ),
