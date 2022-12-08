import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
//import 'model/entity/folders.dart';
/*import 'package:instant_notes/auth_repository.dart';

//import 'auth_repository,dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase implements AuthRepository{
  const AuthFirebase();

  @override
  Future<UserCredential> signInWithEmail(
    final String userName,
    final String password,
  ){
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: userName, password: password);
  }
}*/

//cambios

class FirebaseStorageRepository{
  late final FirebaseStorage _storage;

  FirebaseStorageRepository(){
    _storage = FirebaseStorage.instanceFor(bucket: "gs://instant-notes-mm.appspot.com");
  }

  Future<String> loadFile(String path, String folderName) async {
  //Future<String> loadFile(String path, String folder) async {
  //Future<String> loadFile(String path, FolderEntity folderName) async {
  //Future<String> loadFile(FolderEntity folder) async {
    //final file = File(path);
    final file = File(path);
    //final file = File(folder.urlImage);
    final index = path.lastIndexOf("/") + 1;
    //final index = folder.urlImage.lastIndexOf("/") + 1;
    final fileName = path.substring(index);
    //final fileName = folder.urlImage.substring(index);

    try{
      final ref = _storage.ref("$folderName/$fileName");
      //final ref = _storage.ref("folders/${folder.userEMail}/${folder.id}/$fileName");
      //final ref = _storage.ref().child("folders");
      await ref.putFile(file);
      //await ref.child("folder_prueba.png").putFile(file);
      return await ref.getDownloadURL();
    } on FirebaseException catch (e) {
      return Future.error("Error cargando archivo: $e");
    }
  }
}