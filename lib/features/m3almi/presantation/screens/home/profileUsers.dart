import 'package:auth/features/m3almi/data/datasources/database.dart';
import 'package:auth/features/m3almi/domaine/entities/user.dart';
import 'package:auth/features/m3almi/domaine/usecases/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';





class ProfileUsers extends StatelessWidget {

  Widget build(BuildContext context){
    final AuthService _auth = AuthService();
    final user = Provider.of<User>(context);

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
        body: StreamBuilder<UserData>(
          stream : DataBaseService(uid : user.uid).currentUser,
          builder: (context , snapshot){
            if(!snapshot.hasData) return const Text("loding");
              return ListView.builder(
                //itemCount: snapshot.data.documents.length,
                itemExtent: 80.0,
                itemBuilder: (context , index) =>
                _buildList(context, snapshot.data),
              );
            },
        )
      );
  }

  Widget _buildList(BuildContext context , UserData data){
    return ListTile(
      title: Column(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                data.userName,
              ),
            ),
          ),
          Flexible(
            child : Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                data.phone,
              ),
            ),
          ),
          Flexible(
            child : Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                data.email
              ),
            ),
          )
        ],
      ),
    );
  }

}

