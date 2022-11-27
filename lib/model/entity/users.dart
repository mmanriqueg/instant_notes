//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class UserEntity{
  late String? firstName;
  late String? lastName;
  late String? userName;
  late String? eMail;
//  late String? password;

  UserEntity(
    {this.firstName,
    this.lastName,
    this.userName,
    this.eMail,
//    this.password,
    }
  );

  factory UserEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options){
      var data = snapshot.data();
      return UserEntity(
        firstName: data?["firstName"],
        //firstName: data?["firstName"] ?? "N/A",
        lastName: data?["lastName"],
        userName: data?["userName"],
        eMail: data?["eMail"],
      );
    }

  Map <String, dynamic> toFirestore(){
    return {
      if(firstName != null && firstName!.isNotEmpty) "firstName": firstName,
      if(lastName != null && lastName!.isNotEmpty) "lastName": lastName,
      if(userName != null && userName!.isNotEmpty) "userName": userName,
      if(eMail != null && eMail!.isNotEmpty) "eMail": eMail,
    };
  }

  @override
  String toString(){
    return "UserEntity {$firstName, $lastName, $userName, $eMail}";
  }
}