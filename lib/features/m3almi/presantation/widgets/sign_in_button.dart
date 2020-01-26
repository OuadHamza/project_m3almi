import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget signInButtton( BuildContext context) {
  final loginBloc = Provider.of(context);
   
  return StreamBuilder<Object>(
    stream: loginBloc.buttonSignIsValid,
    builder: (context, snapshot) {
      return Padding(
        padding: EdgeInsets.only(top: 20),
        child: MaterialButton(
          onPressed: snapshot.hasData ? loginBloc.submitLogin : null,
        
          child: Text('SIGN IN',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'SFUIDisplay',
              fontWeight: FontWeight.bold,
              //color: Colors.white
            ),
          ),
          color: Color(0xffff2d55),
          disabledColor: Colors.transparent,
          disabledTextColor: Colors.black,
          elevation: 0,
          minWidth: 350,
          height: 60,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          ),
        ),
      );
    }
  );
}