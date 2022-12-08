import 'package:cloud_firestore/cloud_firestore.dart';

class NoteEntity{
  late String? id;
  late String? name;
  late String? urlImage;
  late String? description;
  late String? photo;
  late String? voiceNote;
  late String? text;
  late String? video;
  late String? screenShot;
  late String? drawing;
  late String? folderId;
  late String? userEMail;

  NoteEntity(
    {this.id,
    this.name,
    this.urlImage,
    this.description,
    this.photo,
    this.voiceNote,
    this.text,
    this.video,
    this.screenShot,
    this.drawing,
    this.folderId,
    this.userEMail,
    }
  );
  
  factory NoteEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options){
      var data = snapshot.data();
      return NoteEntity(
        id: snapshot.id,
        name: data?["name"],
        urlImage: data?["urlImage"],
        description: data?["description"],
        photo: data?["photo"],
        voiceNote: data?["voiceNote"],
        text: data?["text"],
        video: data?["video"],
        screenShot: data?["screenShot"],
        drawing: data?["drawing"],
        folderId: data?["folderId"],
        userEMail: data?["userEMail"],
      );
    }

  Map <String, dynamic> toFirestore(){
    return {
      if(name != null && name!.isNotEmpty) "name": name,
      if(urlImage != null && urlImage!.isNotEmpty) "urlImage": urlImage,
      if(description != null && description!.isNotEmpty) "description": description,
      if(photo != null && photo!.isNotEmpty) "photo": photo,
      if(voiceNote != null && voiceNote!.isNotEmpty) "voiceNote": voiceNote,
      if(text != null && text!.isNotEmpty) "text": text,
      if(video != null && video!.isNotEmpty) "video": video,
      if(screenShot != null && screenShot!.isNotEmpty) "screenShot": screenShot,
      if(drawing != null && drawing!.isNotEmpty) "drawing": drawing,
      if(folderId != null && folderId!.isNotEmpty) "folderId": folderId,
      if(userEMail != null && userEMail!.isNotEmpty) "userEMail": userEMail,
    };
  }

  @override
  String toString(){
    return "NoteEntity {$name, $urlImage, $description, $photo, $voiceNote, $text, $video, $screenShot, $drawing, $folderId, $userEMail}";
  }
}