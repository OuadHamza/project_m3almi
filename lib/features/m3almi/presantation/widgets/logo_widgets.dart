import 'package:flutter/cupertino.dart';

Widget logoWidget(){
  return Container(
    width: 80.0,
    height: 80.0,
    decoration: new BoxDecoration(
    //shape: BoxShape.circle,
      image: new DecorationImage(
        fit: BoxFit.fill,
        image: new AssetImage('assets/logo_m3almi2.png')
      )
    )
  );
}