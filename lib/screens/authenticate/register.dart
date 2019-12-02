import 'package:auth/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Text field state
  String email = "";
  String password = "";
  String error = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        title: Text('Sign up in to m3almi'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ]
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 60.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? ("Enter an Email")  : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                validator: (val) => val.length < 6 ? ("Enter an password 6+ characters long")  : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPssword(email, password);
                    if (result == null) {
                      setState(() => error = "email or password incorrect");
                    }
                  }
                },
              ),
              SizedBox(height: 14.0,),
              Text(
                error,
                style: TextStyle(color: Colors.white)
              )
            ],
          ),
        ),
      ),
    );
  }
}