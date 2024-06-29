import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';


class AddProductRepo{
  Future<void> createProductImage(
    String pname,
    String pcode,
    String pdescription,
    String pstock,
    String price,
    List<XFile> images,
    BuildContext context)
    async{
      final uuid = Uuid();
      final productid = uuid.v4();
      List<String> productImages = [];
      final auth = FirebaseAuth.instance;
      final CollectionReference productImageRef = FirebaseFirestore.instance.collection('addproductdetails');
      try {
        for(final element in images){
          final reference = FirebaseStorage.instance.ref().child('upload_image').child(element.name);
          final file = File(element.path);
          await reference.putFile(file);
          final imageurl = await reference.getDownloadURL();
          productImages.add(imageurl);
        }
        await productImageRef.doc(productid).set(
          {
           'userid': auth.currentUser!.uid,
           'productid': productid,
           'proname': pname,
           'procode': pcode,
           'prodescription': pdescription,
           'prostock': pstock,
           'proprice': price,
          //  'uploadimage': productImages[0].toString(),
          'uploadimage': productImages, // Store the list of URLs
          }
        );
      }on FirebaseAuthException catch (e) {
        // throw Exception('failed');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code.toString())));
      }
    }
}
 