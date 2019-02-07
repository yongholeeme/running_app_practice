import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserApi {
  Firestore _firestore = Firestore.instance;

  Future<int> authenticateUser(String email, String password) async {
    final QuerySnapshot result = await _firestore.collection("users")
      .where("email", isEqualTo: email)
      .getDocuments();
    
    final List<DocumentSnapshot> docs = result.documents;
    if (docs.length == 0) {
      return 0;
    } else {
      return 1;
    }
  }

  Future<void> registerUser(String email, String password) async {
    return _firestore.collection("users")
      .document("users")
      .setData({"email":email, "password":password});
  }
}