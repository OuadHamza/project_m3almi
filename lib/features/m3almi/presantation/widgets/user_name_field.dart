import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget userNameFiled( BuildContext context) {
  final loginBloc = Provider.of(context);
  return StreamBuilder<dynamic>(
    stream: loginBloc,
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
              labelText: 'User name',
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.white
              )
            ),
            onChanged: loginBloc.userNameChanged,
            // validator: (value) =>  value.isEmpty ? ("Enter an Email")  : null,
            // onChanged: (val) {
            //   setState(() => userName = val);
            // },
          ),
      );
    }
  );
}