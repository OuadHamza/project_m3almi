import 'package:auth/features/m3almi/domaine/usecases/auth.dart';
import 'package:auth/features/m3almi/presantation/screens/wrapeer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/m3almi/domaine/entities/user.dart';

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
