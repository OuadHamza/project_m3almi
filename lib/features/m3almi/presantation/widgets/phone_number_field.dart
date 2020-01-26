import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget phoneNumberFiled( BuildContext context) {
  final loginBloc = Provider.of(context);
  return StreamBuilder<Object>(
    stream: loginBloc.phoneNumber,
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
              labelText: 'Phone Number',
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.white
              )
            ),
            onChanged: loginBloc.phoneNumberChanged,
            // validator: (value) =>  value.isEmpty ? ("Enter an Email")  : null,
            // onChanged: (val) {
            //   setState(() => userName = val);
            // },
          ),
      );
    }
  );
}