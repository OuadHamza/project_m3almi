import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget errorWidget(String error){
  return Padding(
    padding: EdgeInsets.only(top: 30),
    child: Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: error,
              style: TextStyle(
                fontFamily: 'SFUIDisplay',
                color: Colors.red,
                fontSize: 20,
              )
            ),
          ]
        ),
      ),
    ),
  );
}