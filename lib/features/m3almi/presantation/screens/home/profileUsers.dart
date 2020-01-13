import 'package:auth/features/m3almi/data/datasources/database.dart';
import 'package:auth/features/m3almi/domaine/usecases/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class ProfileUsers extends StatelessWidget {
  const ProfileUsers({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  

  Widget _buildList(BuildContext context , DocumentSnapshot document){
    return ListTile(
      title: Column(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                document['userName']
              ),
            ),
          ),
          Flexible(
            child : Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                document['phone']
              ),
            ),
          ),
          Flexible(
            child : Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                document['email']
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context){
    final AuthService _auth = AuthService();
    return Scaffold(
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
        body: Container(
          child: StreamBuilder(
            stream: Firestore.instance.collection('users').snapshots(),
            builder: (context , snapshot){
              if(!snapshot.hasData) return const Text("loding");
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemExtent: 80.0,
                itemBuilder: (context , index) =>
                _buildList(context, snapshot.data.documents[index]),
              );
            },
          ),
        )
    );
  }


      /*child : Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: DrawerHeader(
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection('users')
                    .document(user.uid)
                    .snapshots(),
                builder: ( context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    //return Text(snapshot.data['email']);
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 50,bottom: 5),
                            child: Center(
                              child : Text(
                                snapshot.data['phone'],
                                style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'SFUIDisplay',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),
                              ),
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 50,bottom: 5),
                            child: Center(
                              child : Text(
                                snapshot.data['userName'],
                                style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'SFUIDisplay',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),
                              ),
                            )
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 50,bottom: 5),
                          //   child: Center(
                          //     child : Text(
                          //       snapshot.data['phone'],
                          //       style: TextStyle(
                          //         fontSize: 40,
                          //         fontFamily: 'SFUIDisplay',
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.black
                          //       ),
                          //     ),
                          //   )
                          // )
                        ],
                      )
                    );
                  }
                  return LinearProgressIndicator();
                },
              ),
            )// : Center(child: Text('loding ...'),
          )*/
}

  