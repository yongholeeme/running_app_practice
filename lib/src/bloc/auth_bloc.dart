import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  FirebaseAuth _firebaseAuth;
  GoogleSignIn _googleSignIn;
  Firestore _firestore = Firestore.instance;

  final _isSignedIn = BehaviorSubject<bool>();

  AuthBloc(this._firebaseAuth, this._googleSignIn){
  }

  // Stream of User State
  Stream<FirebaseUser> get activeUser =>
    _firebaseAuth.onAuthStateChanged.asBroadcastStream();

  // Google SigIn
  Future<FirebaseUser> login() async {
    print("(log) click GOOGLE SIGN IN button");
    // google login
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn()
    .catchError((onError) {
      print("_googleSignIn.signIn Error");
      print(onError);
    });
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    /**
     * firebase_auth: ^0.8.0+1
     */
    // final AuthCredential credential = GoogleAuthProvider.getCredential(
    //   accessToken: googleSignInAuthentication.accessToken,
    //   idToken: googleSignInAuthentication.idToken,
    // );
    // final FirebaseUser user = await _firebaseAuth.signInWithCredential(credential);

    /**
     * firebase_auth: ^0.6.6
     */
    final FirebaseUser user = await _firebaseAuth.signInWithGoogle(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    ).catchError((onError) {
      print("signInWithGoogle Error");
      print(onError);
    }) ;

    // final FirebaseUser currentUser = await _firebaseAuth.currentUser();
    // assert(user.uid == currentUser.uid);
    /**
     * FirebaseUser user
     * providerId
     * uid
     * displayName
     * photoUrl
     * email
     */
    _firestore.document('users/${user.uid}').get().then((docSnap) {
      if (docSnap.data == null) {
        _firestore.collection('users').document(user.uid).setData({
          'uid':user.uid,
          'photoUrl': user.photoUrl,
          'providerId': user.providerId,
          'displayName': user.displayName,
          'email': user.email,
          'firstLoginDate': new DateTime.now(),
          'lastLoginDate': new DateTime.now()
        });
      } else {
        // update the last Login Date when signed user start app.
        _firestore.document('users/${user.uid}').updateData({
          'photoUrl': user.photoUrl,
          'displayName': user.displayName,
          'lastLoginDate': new DateTime.now(),
        });
      }
    }).catchError((error) {
      print("(log) error at auth_bloc.dart");
      print(error);
    });

    return user;
  }

  void logout() {
    print("(log) click LOGOUT button");
    print(_googleSignIn.currentUser);
    _googleSignIn.signOut();
    _firebaseAuth.signOut();
  }

  void confirm() {
    print(_googleSignIn.currentUser.id);
    print(_googleSignIn.isSignedIn());
  }

  String getUid() {
    _firebaseAuth.currentUser().then((data) {
      return data.uid;
    });
    // return user.uid;
  }

  void dispose() async {
    await _isSignedIn.drain();
    _isSignedIn.close();
  }
}