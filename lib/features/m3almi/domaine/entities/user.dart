import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String userName;
  final String email;
  final String password;
  final int phone;
  final String adress;
  final String photoUrl;

  User({
    this.uid,
    this.userName,
    this.email ,
    this.password ,
    this.phone ,
    this.adress ,
    this.photoUrl  });
}