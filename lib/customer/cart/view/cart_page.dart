import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/customer/checkout/checkout.dart';
import 'package:e_commerce_app/customer/checkout/repository/ordeCollection_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late double grandTotal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 239, 244),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 124, 178),
        centerTitle: true,
        title: Text(
          "your cart list",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            // fontStyle: FontStyle.italic
          ),
        ),
        leading: Icon(
          Icons.shopping_basket_rounded,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cart').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          final cartDataDoc = snapshot.data!.docs;
          final cartData = snapshot.data;

          grandTotal = 0;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartDataDoc.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartDataDoc[index];
                    final quantity = int.parse(cartItem['quantity'].toString());
                    final price = double.parse(cartItem['productPrice'].toString());
                    final subTotal = quantity * price;
                    grandTotal += subTotal;
                    print(cartItem['imageUrl'][0].toString());
                    return ListTile(
                      title: Text(cartItem['productName'].toString()),
                      // leading: CircleAvatar(
                      //   radius: 30,
                      //   backgroundImage:
                      //   NetworkImage(cartItem['imageUrl'].toString(),),
                      // ),
                      leading: Image.network(cartItem['imageUrl'].toString(),width: 50,height: 50,),
                      subtitle: Text(cartItem['productPrice'].toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  FirebaseFirestore.instance
                                      .collection('cart')
                                      .doc(cartItem.id)
                                      .update({'quantity': quantity + 1});
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(cartItem['quantity'].toString()),
                          ),
                          if (quantity >= 1)
                            InkWell(
                              onTap: () {
                                setState(() {
                                  FirebaseFirestore.instance
                                      .collection('cart')
                                      .doc(cartItem.id)
                                      .update({'quantity': quantity - 1});
                                });
                              },
                              child: Icon(Icons.remove),
                            )
                          else
                            InkWell(
                              onTap: () {
                                setState(() {
                                  FirebaseFirestore.instance
                                      .collection('cart')
                                      .doc(cartItem.id)
                                      .delete();
                                });
                              },
                              child: Icon(Icons.delete_forever),
                            )
                        ],
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 49, 124, 178),
                  ),
                  onPressed: () async {
 
                  final orderId = await OrderCollectionRepo()
                    .placeOrder(cartData!, context);

                    await Get.off(CheckOutScreen(
                      grandTotal: grandTotal, 
                      cartData: cartData, 
                      orderId: orderId
                      ));
                    
                  },
                  child: Text(
                    'checkout',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          );
        },
      ),
    );
  }
}























// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class CartPage extends StatefulWidget {
//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   late double grandTotal;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 235, 239, 244),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 49, 124, 178),
//         centerTitle: true,
//         title: Text(
//           "Cart Page",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.normal,
//           ),
//         ),
//         leading: Icon(
//           Icons.shopping_basket_rounded,
//           color: Colors.white,
//         ),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('cart').snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }

//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           final cartDataDocs = snapshot.data!.docs;

//           grandTotal = 0;

//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: cartDataDocs.length,
//                   itemBuilder: (context, index) {
//                     final cartItem = cartDataDocs[index];
//                     final quantity = cartItem['quantity'] as int;
//                     final price = cartItem['price'] as double;
//                     final subTotal = quantity * price;
//                     grandTotal += subTotal;

//                     return ListTile(
//                       title: Text(cartItem['productName'].toString()),
//                       leading: CircleAvatar(
//                         backgroundImage: NetworkImage(
//                           cartItem['imageUrl'].toString(),
//                         ),
//                       ),
//                       subtitle: Text(cartItem['price'].toString()),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   FirebaseFirestore.instance
//                                       .collection('cart')
//                                       .doc(cartItem.id)
//                                       .update({'quantity': quantity + 1});
//                                 });
//                               },
//                               child: Icon(Icons.add),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Text(cartItem['quantity'].toString()),
//                           ),
//                           if (quantity > 1)
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   FirebaseFirestore.instance
//                                       .collection('cart')
//                                       .doc(cartItem.id)
//                                       .update({'quantity': quantity - 1});
//                                 });
//                               },
//                               child: Icon(Icons.remove),
//                             )
//                           else
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   FirebaseFirestore.instance
//                                       .collection('cart')
//                                       .doc(cartItem.id)
//                                       .delete();
//                                 });
//                               },
//                               child: Icon(Icons.delete_forever),
//                             )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 'Grand Total: $grandTotal',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
