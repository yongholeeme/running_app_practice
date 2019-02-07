import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

import '../model/user_model.dart';

class UserBloc {
  final Firestore _firestore;
  final StreamController<FirebaseUser> _userController =
      StreamController.broadcast();

  StreamSink<FirebaseUser> get setActiveUser => _userController.sink;

  Stream<List<UserModel>> get thingsForActiveUser =>
      Observable(_userController.stream)
      .switchMap((user) => _getThingsForUser(user));

  Stream<List<UserModel>> _getThingsForUser(FirebaseUser user) => _firestore
      .collection("/${user.uid}/things")
      .snapshots()
      .map((q) => q.documents)
      .map((list) => list.map((ds) => UserModel.fromSnapshot(ds)));

  // Stream<UserModel> _getUserData(FirebaseUser user) => 
  //   _firestore.collection('user/${user.uid}').snapshots().map();

  UserBloc(this._firestore);

  void dispose() {
    _userController.close();
}
}