import 'package:auth/features/m3almi/domaine/usecases/auth.dart';
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

      // Text field state
      String userName = "";
      String email = "";
      String phone = "";
      String adress = "";
      String photoUrl = "";
      String password = "";
      String confirmPass = "";
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
              title: Text('Register'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Sign in'),
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
                padding: EdgeInsets.all(20),
                child: ListView(
                  children: <Widget>[
                  //SizedBox(height: 200,),
                  Form(
                    key: _formKey,
                    child: new SingleChildScrollView(
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
                            style: TextStyle(
                            color: Colors.white,
                            ),
                            decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white
                              )
                            ),
                            labelText: 'UserName',
                            labelStyle: TextStyle(fontSize: 15,
                            color: Colors.white)
                          ),
                            validator: (value) =>  value.isEmpty ? ("Enter an Email")  : null,
                            onChanged: (val) {
                              setState(() => userName = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            style: TextStyle(
                            color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white
                                )
                              ),
                              labelText: 'email',
                              labelStyle: TextStyle(fontSize: 15,
                                color: Colors.white
                              ),
                             ),
                            validator: (val) => val.isEmpty ? ("Enter an Email")  : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            style: TextStyle(
                            color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white
                                )
                              ),
                              labelText: 'telephone',
                              labelStyle: TextStyle(fontSize: 15,
                                color: Colors.white
                              ),
                             ),
                            validator: (val) => val.length != 10 ? ("Enter a valid number")  : null,
                            onChanged: (val) {
                              setState(() => phone = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            key: passKey,
                           style: TextStyle(
                            color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white
                                )
                              ),
                              labelText: 'password',
                              labelStyle: TextStyle(fontSize: 15,
                                color: Colors.white
                              ),
                            ),
                            obscureText: true,
                            validator: (val) => val.length < 6 ? ("Enter an password 6+ characters long")  : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            style: TextStyle(
                            color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white
                                )
                              ),
                              labelText: 'confirm password',
                              labelStyle: TextStyle(fontSize: 15,
                                color: Colors.white
                              ),
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
                          MaterialButton(
                            child: Text('ENREGISTRER',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'SFUIDisplay',
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            color: Color(0xffff2d55),
                            elevation: 0,
                            minWidth: 350,
                            height: 60,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                dynamic result = await _auth.registerWithEmailAndPssword(email, password , userName , phone , adress, photoUrl);
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
                ],
              ),
            ),
            ),
          ),
        );
      }
    }