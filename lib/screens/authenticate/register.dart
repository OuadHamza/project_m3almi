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
        title: Text('Sign up'),
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
          child: new SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/logo_m3almi2.png')
                    )
                  )
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.isEmpty ? ("Enter an Email")  : null,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      fillColor: Colors.grey,
                      filled: true,
                    ),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  validator: (val) => val.length < 6 ? ("Enter an password 6+ characters long")  : null,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    fillColor: Colors.grey,
                    filled: true,
                  ),
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                Material(
                  borderRadius: BorderRadius.circular(30.0),
                  //elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.registerWithEmailAndPssword(email, password);
                        if (result == null) {
                          setState(() => error = "email or password incorrect");
                        }
                      }
                    },
                    minWidth: 150.0,
                    height: 50.0,
                    color: Color(0xFF179CDF),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),

                  ),
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
      ),
    );
  }
}