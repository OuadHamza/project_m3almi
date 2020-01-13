import 'package:auth/features/m3almi/domaine/usecases/auth.dart';
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
                //SizedBox(height: 200,),
                Form(
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
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: error,
                                  style: TextStyle(
                                    fontFamily: 'SFUIDisplay',
                                    color: Colors.red,
                                    fontSize: 20,
                                  )
                                ),
                              ]
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (val) => val.isEmpty ? ("Enter an Email")  : null,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white
                              )
                            ),
                            labelText: 'email',
                            labelStyle: TextStyle(fontSize: 15,
                            color: Colors.white)
                          ),
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white
                              )
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(fontSize: 15,
                            color: Colors.white)
                          ),
                        validator: (val) => val.length < 6 ? ("Enter an password 6+ characters long")  : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      )
                    ],
                  ),
                ),
                Align(
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
                ),
                
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() => error = "email or password incorrect");
                        } 
                      }
                    },
                    child: Text('SIGN IN',
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
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: (){
                      widget.toggleView();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        //Icon(FontAwesomeIcons.facebookSquare),
                        Text('Register',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'SFUIDisplay'
                        ),)
                      ],
                    ),
                    color: Colors.transparent,
                    elevation: 0,
                    minWidth: 350,
                    height: 60,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.white)
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