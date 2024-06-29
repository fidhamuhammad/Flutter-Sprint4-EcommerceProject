import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddCartRepo {
  Future<void> addToCart(
    QueryDocumentSnapshot<Map<String, dynamic>> productData,
    BuildContext context
  )async {
    final _auth = FirebaseAuth.instance;
    final CollectionReference cart = FirebaseFirestore.instance.collection('cart');
    var uuid = Uuid();

    // Clean and validate the image URL
    String imageUrl = productData['uploadimage'].toString();
    imageUrl = imageUrl.replaceAll(RegExp(r'\[|\]'), '').trim();
    bool isValidUrl = Uri.tryParse(imageUrl)?.hasAbsolutePath ?? false;

    // Fallback for invalid URL
    if (!isValidUrl) {
      imageUrl = '';
    }

    try {
      dynamic val;
      var userCartData = await cart
      .where('productId', isEqualTo: productData['productid'].toString())
      .where('userId', isEqualTo: _auth.currentUser!.uid)
      .get();
      print(userCartData.docs.length);
      if (userCartData.docs.length == 0) {
        val = await cart.add({
          'cartiId': uuid.v4(),
          'productId': productData['productid'].toString(),
          'userId' : _auth.currentUser!.uid,
          'quantity' : 1,
          'productName' : productData['proname'].toString(),
          'imageUrl' : productData['uploadimage'].toString(),
          'productPrice' : productData['proprice'].toString(),
          'productDescription' : productData['prodescription'].toString(),
          'productCode' : productData['procode'].toString(),
          'productStock' : productData['prostock'].toString(),
        });
      } else {
        for (var i  in userCartData.docs) {
          await cart.doc(i.id).update({
            'quantity' : i.get('quantity') + 1,
          });
        }
      }
      if (val == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add cart')));
      }
    }on FirebaseException catch (e) {
      throw Exception('Failed to add to cart: $e');
    }
  }
}