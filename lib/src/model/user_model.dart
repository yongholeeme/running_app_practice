import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;

  UserModel(this.id, this.name);

  UserModel.fromSnapshot(DocumentSnapshot ds)
      : id = ds.documentID,
        name = ds['name'];
}