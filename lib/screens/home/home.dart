import 'package:auth/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
     return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/loginBg.png"),
          fit: BoxFit.cover,
        )
      ), 
      child : Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Home', textAlign: TextAlign.center,),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ]
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child : Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/logo_m3almi2.png')
                    )
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50,bottom: 5),
                child: Center(
                  child : Text(
                    'Wellcome To M3almi',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'SFUIDisplay',
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: MaterialButton(
                  onPressed: (){
                  },
                  child:Text('connected as user',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'SFUIDisplay'
                      ),
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
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: MaterialButton(
                  onPressed: (){
                  },
                  child:Text('connected as professionel',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'SFUIDisplay'
                      ),
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
    );
  }
}