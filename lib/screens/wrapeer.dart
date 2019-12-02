import 'package:auth/models/user.dart';
import 'package:auth/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticate/autehnticate.dart';
//import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return either home or authenticate widget
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
    
  }
}