import 'package:auth/features/m3almi/presantation/screens/home/profileUsers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticate/autehnticate.dart';


//import 'home/home.dart';

class Wrapper extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    //return either home or authenticate widget
    if(user == null){
      return Authenticate();
    }else{
      return ProfileUser();
    }
    
  }
}