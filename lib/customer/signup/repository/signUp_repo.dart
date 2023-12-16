import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupRepo {

   Future <void> createUser(
    String name,
    String address,
    String phonenumber,
    String email,
    String password,
    BuildContext context)
    async{
      final _auth = FirebaseAuth.instance;
      final CollectionReference userRef = FirebaseFirestore.instance.collection('usercollection');

      try {
        final UserCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        userRef.doc(
          UserCredential.user!.uid
        ).set({
          'userid' : _auth.currentUser!.uid,
          'usertype' : 'customer',
          'name' : name,
          'address' : address,
          'phonenumber': phonenumber,
          'email' : email,
          'password' : password,
        });
      }on FirebaseAuthException catch (e) {
        throw Exception('signup failed!!');
      }
    }

}