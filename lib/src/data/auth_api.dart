import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/src/models/auth/index.dart';

class AuthApi {
  const AuthApi({@required FirebaseAuth auth, @required FirebaseFirestore firestore})
      : assert(auth != null),
        assert(firestore != null),
        _firestore = firestore,
        _auth = auth;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Future<AppUser> login({@required String email, @required String password}) async {
    final UserCredential response = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = response.user;

    final DocumentSnapshot snapshot = await _firestore.doc('users/${user.uid}').get();

    return AppUser.fromJson(snapshot.data());
  }
}
