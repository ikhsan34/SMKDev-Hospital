import 'package:firebase_auth/firebase_auth.dart';
import 'package:hospital/services/account.dart';
import 'package:hospital/services/database.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create object user
  Account _userFromFirebaseObject(User user) {
    return user != null ? Account(uid: user.uid, email: user.email) : null;
  }

  Stream<Account> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _userFromFirebaseObject(user));
  }

  // Sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseObject(user);

    } catch (e) {
      print(e);
      return null;
    }
  }

  // Logout
  Future logout() async {
    try {
      return _auth.signOut();

    } catch(e) {
      print(e);
      return null;

    }
  }

  // Register with email
  Future registerWithEmail(String name, String sex, String phone, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      // Create user document
      await Database(uid: user.uid).updateUserData(name, sex, phone);
      return _userFromFirebaseObject(user);

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign In with email
  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      //print(user.email);
      return _userFromFirebaseObject(user);

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}
