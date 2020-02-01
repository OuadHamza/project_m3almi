import 'package:auth/features/m3almi/data/datasources/database.dart';
import 'package:auth/features/m3almi/domaine/usecases/auth.dart';
import 'package:auth/features/m3almi/presantation/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfileUser extends StatelessWidget {

  Widget build(BuildContext context){
    final AuthService _auth = AuthService();
    final user = Provider.of<FirebaseUser>(context);
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = 'https://scontent.frak1-2.fna.fbcdn.net/v/t1.0-9/71694656_2471391502928067_2825705936620879872_n.jpg?_nc_cat=107&_nc_ohc=heeio_LjTwQAX9OzCr7&_nc_ht=scontent.frak1-2.fna&oh=85d7e3f9d41d9518fceb06c0f8d4a4c8&oe=5ED824F9';

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
                  if(!snapshot.hasData) return loadingSpinner();
                  return new Stack(children: <Widget>[
                    new Container(color: Colors.blue,),
                    //new Image.network(imgUrl, fit: BoxFit.fill,),
                    new Scaffold(
                        drawer: new Drawer(child: new Container(),),
                        backgroundColor: Colors.transparent,
                        body: new Center(
                          child: new Column(
                            children: <Widget>[
                              new SizedBox(height: _height/12,),
                              new CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: NetworkImage(imgUrl),),
                              new SizedBox(height: _height/25.0,),
                              new Text(snapshot.data.userName, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
                              new Padding(padding: new EdgeInsets.only(
                                top: _height/30,
                                left: _width/8,
                                right: _width/8
                              ),
                                child:new Text(snapshot.data.email,
                                  style: new TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: _width/25,color:
                                    Colors.white),textAlign:
                                    TextAlign.center,
                                  ),
                                ),
                                new Padding(padding: new EdgeInsets.only(
                                  top: _height/30,
                                  left: _width/8,
                                  right: _width/8
                                ),
                                  child:new Text(snapshot.data.phoneNumber,
                                    style: new TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: _width/25,color:
                                      Colors.white),textAlign:
                                      TextAlign.center,
                                    ),
                                  ),

                                  new SizedBox(height: _height/25.0,),
                                  if (snapshot.data.isEmployer == true)
                                    Text("Employer",
                                    style: new TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: _width/25,color:
                                      Colors.white),textAlign:
                                      TextAlign.center,
                                    ),
                                    Text("Client",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: _width/25,color:
                                        Colors.white),textAlign:
                                        TextAlign.center,
                                      ),
                            ],
                          ),
                        )
                    )
                  ],);
                  }
                ),
            ),
          ),
        );
  }
}


