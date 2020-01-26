import 'package:auth/features/m3almi/presantation/bloc/login_bloc.dart';
import 'package:auth/features/m3almi/presantation/screens/wrapeer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
          value: FirebaseAuth.instance.onAuthStateChanged,
        ),
        Provider<dynamic>.value(
          value: LoginBloc(),
        ),
      ],
      child : MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          primaryColor: Colors.black
        ),
        home: Wrapper(),
        ),
    );
      
    
  }
}
