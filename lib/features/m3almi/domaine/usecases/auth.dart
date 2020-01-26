import 'package:auth/features/m3almi/data/datasources/database.dart';
import 'package:auth/features/m3almi/domaine/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersCollection = Firestore.instance.collection('users');

  // create user obj based on FirebaseUser
  User _userFromeFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid , email: user.email , phoneNumber: user.phoneNumber) : null;
  }

  // auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromeFirebase);
  }
  //sign as anony
  Future signInAnonymously() async{
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromeFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signUp with email and password
  Future registerWithEmailAndPssword(String email , String password , String userName , String phone ) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await DataBaseService(uid: user.uid).updateUserData(email, userName, phone);
      return _userFromeFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signIN with email and passwords
  Future signInWithEmailAndPassword(String email , String password) async {
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