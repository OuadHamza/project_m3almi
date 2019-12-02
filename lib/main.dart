import 'package:auth/models/user.dart';
import 'package:auth/screens/wrapeer.dart';
import 'package:auth/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
          value : AuthService().user,
          child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
