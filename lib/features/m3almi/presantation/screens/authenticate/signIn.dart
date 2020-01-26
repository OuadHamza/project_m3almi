import 'package:auth/features/m3almi/presantation/widgets/email_feild.dart';
import 'package:auth/features/m3almi/presantation/widgets/error_widget.dart';
import 'package:auth/features/m3almi/presantation/widgets/forgot_pass_button.dart';
import 'package:auth/features/m3almi/presantation/widgets/logo_widgets.dart';
import 'package:auth/features/m3almi/presantation/widgets/password_filed.dart';
import 'package:auth/features/m3almi/presantation/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  

  final _formKey = GlobalKey<FormState>();
  String error = "";

  @override
   Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/loginBg.png"),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Sign In'),
          actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.all(23),
            child: ListView(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      logoWidget(),
                      errorWidget(error),
                      emailFiled(context),
                      passwordFiled(context),
                    ],
                  ),
                ),
                forgotPasswordButtton(context),
                signInButtton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}