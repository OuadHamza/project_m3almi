import 'package:auth/features/m3almi/data/datasources/database.dart';
import 'package:auth/features/m3almi/domaine/usecases/auth.dart';
import 'package:firebase_auth/firebase_auth.dart'; 



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfileUser extends StatelessWidget {

  Widget build(BuildContext context){
    final AuthService _auth = AuthService();
    final user = Provider.of<FirebaseUser>(context);
      return Scaffold(
          appBar: AppBar(
              title: Text('Profile', textAlign: TextAlign.center,),
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
          body: Container(
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
              child: StreamBuilder(
                stream: DataBaseService(uid:user.uid ).currentUser,
                builder : (context , snapshot)  {
                  print(snapshot.data);
                  if(!snapshot.hasData) return Text('loading data');
                  return Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Text(
                            snapshot.data.userName,
                            style: TextStyle(
                              fontSize: 30.0
                            ),
                          ),
                        ),
                      Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Text(
                            snapshot.data.phoneNumber,
                             style: TextStyle(
                              fontSize: 30.0
                            ),
                          ),
                        ),
                      Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Text(
                            snapshot.data.email,
                             style: TextStyle(
                              fontSize: 30.0
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                ),
            ),
          ),
        );
  }
}


