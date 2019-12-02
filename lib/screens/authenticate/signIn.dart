import 'package:auth/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormFieldState>();

  bool _userExist = false;
  checkUserValue<bool>(String user) {
    _doesEmailAlreadyExist(user).then((val){
          if(val){
            print ("UserName Already Exits");
            _userExist = val;
          }
          else{
            print ("UserName is Available");
            _userExist = val;
          }
        });
        return _userExist;
      }
    
      // Text field state
      String userName = "";
      String email = "";
      String phone = "";
      String password = "";
      String confirmPass = "";
      String error = "";
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.red[900],
          appBar: AppBar(
            backgroundColor: Colors.red[400],
            elevation: 0.0,
            title: Text('Sign in to m3almi'),
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
            padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 60.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                    //shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage('assets/logo_m3almi2.png')
                      )
                    )
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'User name',
                      fillColor: Colors.grey,
                      filled: true,
                    ),
                    validator: (value) => checkUserValue(value) ? "Username already taken" : null,
                    onChanged: (val) {
                      setState(() => userName = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      fillColor: Colors.grey,
                      filled: true,
                    ),
                    validator: (val) => val.isEmpty ? ("Enter an Email")  : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      fillColor: Colors.grey,
                      filled: true,
                    ),
                    validator: (val) => val.length != 10 ? ("Enter a valid number")  : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    key: passKey,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: Colors.grey,
                      filled: true,
                    ),
                    obscureText: true,
                    validator: (val) => val.length < 6 ? ("Enter an password 6+ characters long")  : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      fillColor: Colors.grey,
                      filled: true,
                    ),
                    obscureText: true,
                   validator: (confirmation){
                      var password = passKey.currentState.value;
                      return  (confirmation == password) ? null : "Confirm Password should match password";
                    },
                    onChanged: (val) {
                      setState(() => confirmPass = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'Sign IN',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.signWithEmailAndPssword(email, password);
                        if (result == null) {
                          setState(() => error = "this email already existe");
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
    
    _doesEmailAlreadyExist(String user) {
}