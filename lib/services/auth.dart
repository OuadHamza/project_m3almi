import 'package:auth/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  User _userFromeFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromeFirebase);
  }
  //sign as anony
  Future signInOut() async{
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromeFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign with email and password
  Future signWithEmailAndPssword(String email , String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromeFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and passwords
  Future registerWithEmailAndPssword(String email , String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromeFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}