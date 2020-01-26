import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget emailFiled( BuildContext context) {
  final loginBloc = Provider.of<dynamic>(context);
  return StreamBuilder<Object>(
    stream: loginBloc.email,
    builder: (context, snapshot) {
      return Container(
          child : TextFormField(
            style: TextStyle(
            color: Colors.white,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                )
              ),
              errorText: snapshot.error,
              labelText: 'Email Adress',
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.white
              )
            ),
            onChanged: loginBloc.emailChanged,
          ),
      );
    }
  );
}