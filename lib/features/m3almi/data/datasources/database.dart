import 'package:auth/features/m3almi/domaine/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DataBaseService{
  final String uid;
  DataBaseService({this.uid});



  final CollectionReference userCollection = Firestore.instance.collection('users');
  Future updateUserData(String email , String userName , String phone , String adress , String photoUrl) async{

    return await userCollection.document(uid).setData({
      'userName': userName,
      'phone' : phone,
      'email' : email,
      'adress' : adress,
      'photoUrl' : photoUrl
    });
  }

  UserData _userData(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      phone : snapshot.data['phone'],
      email : snapshot.data['email'],
      adress : snapshot.data['adress'],
      photoUrl : snapshot.data['photoUrl'],
    );
  }

  Stream<QuerySnapshot> get users{
    return userCollection.snapshots();
  }

  Stream<UserData> get currentUser{
    return userCollection.document(uid).snapshots().map(_userData);
  }
}