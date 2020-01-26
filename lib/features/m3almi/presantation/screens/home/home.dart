import 'package:auth/features/m3almi/domaine/usecases/auth.dart';
import 'package:auth/features/m3almi/presantation/widgets/image_capture.dart';
import 'package:auth/features/m3almi/presantation/widgets/logo_widgets.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
     return Container(
      child : Scaffold(
        //backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Home', textAlign: TextAlign.center,),
          backgroundColor: Colors.amber,
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
        body:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Colors.amber[800],
                Colors.amber[700],
                Colors.amber[600],
                Colors.amber[400]
              ],
            )
          ),
          child : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                logoWidget(),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ImageCapture()),
                      );
                    
                    },
                    child:Text('connected as employer',
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
      ),
    );
  }
}