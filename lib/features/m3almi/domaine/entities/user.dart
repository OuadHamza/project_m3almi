import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class User extends Equatable {
  final String uid;
  final String email;
  final String password;
  final int phone;
  final String adress;

  User({
    @required this.uid ,
     this.email ,
     this.password ,
     this.phone ,
     this.adress ,
  });
}