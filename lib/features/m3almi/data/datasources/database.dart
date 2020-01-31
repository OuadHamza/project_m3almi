import 'package:auth/features/m3almi/domaine/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DataBaseService{
  final String uid;
  DataBaseService({this.uid});



  final CollectionReference userCollection = Firestore.instance.collection('users');
  Future updateUserData(String email , String userName , String phoneNumber , bool isEmployer ) async{

    return await userCollection.document(uid).setData({
      'userName': userName,
      'phoneNumber' : phoneNumber,
      'email' : email,
      'isEmployer' : isEmployer
    });
  }

  User _userData(DocumentSnapshot snapshot){
    return User(
      phoneNumber : snapshot.data['phoneNumber'],
      email : snapshot.data['email'],
      userName : snapshot.data['userName'],
      isEmployer : snapshot.data['isEmployer']
    );
  }

  Stream<QuerySnapshot> get users{
    return userCollection.snapshots();
  }

  Stream<User> get currentUser{
    return userCollection.document(uid).snapshots().map(_userData);
  }
}