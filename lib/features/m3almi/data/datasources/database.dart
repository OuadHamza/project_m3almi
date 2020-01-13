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

  Stream<QuerySnapshot> get users{
    return userCollection.snapshots();
  }
}