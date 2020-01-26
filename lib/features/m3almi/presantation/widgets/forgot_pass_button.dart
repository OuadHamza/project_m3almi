import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

Widget forgotPasswordButtton( BuildContext context) {
  //final loginBloc = Provider.of(context);
   
  return StreamBuilder<Object>(
    stream: null,
    builder: (context, snapshot) {
      return Align(
        alignment: Alignment.centerRight,
        child: Padding(
        padding: EdgeInsets.only(top: 20,bottom: 5),
          child: MaterialButton(
          onPressed: () async {
          },
          child: Text('Forgot your password?',
            textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'SFUIDisplay',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
      ),
      );
    }
  );
}