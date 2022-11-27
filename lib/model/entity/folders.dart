import 'package:cloud_firestore/cloud_firestore.dart';

class FolderEntity{
  late String? id;
  late String? name;
  late String? urlImage;
  late String? description;
  late String? userEMail;

  FolderEntity(
    {this.id,
    this.name,
    this.urlImage,
    this.description,
    this.userEMail,
    }
  );

  factory FolderEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options){
      var data = snapshot.data();
      return FolderEntity(
        id: snapshot.id,
        //id: data?["name"],
        name: data?["name"],
        urlImage: data?["urlImage"],
        description: data?["description"],
        userEMail: data?["userEMail"],
      );
    }

  Map <String, dynamic> toFirestore(){
    return {
      if(name != null && name!.isNotEmpty) "name": name,
      if(urlImage != null && urlImage!.isNotEmpty) "urlImage": urlImage,
      if(description != null && description!.isNotEmpty) "description": description,
      if(userEMail != null && userEMail!.isNotEmpty) "userEMail": userEMail,
    };
  }

  @override
  String toString(){
    return "FolderEntity {$name, $urlImage, $description, $userEMail}";
  }
}