import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential =  GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    final UserCredential userCredential = await _firebaseAuth.signInWithCredential(authCredential);

    final User user = userCredential.user;
    assert(user.displayName != null);
    assert(user.email != null);

    final User currentUser = _firebaseAuth.currentUser;
    assert(currentUser.uid == user.uid);
    return "something wrong";
  }

  Future<String> googleSignOut()async{
    _googleSignIn.signOut();

    return 'something went wrong';
  }
}
