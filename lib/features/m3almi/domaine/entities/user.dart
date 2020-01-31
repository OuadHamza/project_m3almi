import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String userName;
  final String email;
  final String password;
  final String phoneNumber;
  final String adress;
  final String photoUrl;
  final bool isEmployer;

  User({
    this.uid,
    this.userName,
    this.email ,
    this.password ,
    this.phoneNumber ,
    this.adress ,
    this.photoUrl,
    this.isEmployer });
}


