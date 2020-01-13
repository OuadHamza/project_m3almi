import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;


  User({
    this.uid,
   });
}


class UserData extends Equatable {
  final String uid;
  final String userName;
  final String email;
  final String password;
  final String phone;
  final String adress;
  final String photoUrl;

  UserData({
    this.uid,
    this.userName,
    this.email ,
    this.password ,
    this.phone ,
    this.adress ,
    this.photoUrl  });
}