import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterRepo{
  Future <void> createUser(
    String bname, 
    String baddress,
    String bdescription,
    String ename,
    String address,
    String mobile,
    String email,
    String password,
    BuildContext context,
  )
  async{
    final _auth = FirebaseAuth.instance;
    final CollectionReference userRef = FirebaseFirestore.instance.collection('sellercollection');

    try {
      final UserCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      userRef.doc(
        UserCredential.user!.uid
      ).set(
        {
            'userid' : _auth.currentUser!.uid,
            'usertype' : 'seller',
            'bname' : bname,
            'baddress' : baddress,
            'bdescription' : bdescription,
            'ename': ename,
            'address': address,
            'mobile': mobile,
            'email': email,
            'password':password,
        }
      );
    }on FirebaseAuthException catch (e) {
      throw Exception('signup failed!!');
    }

  }
     
}