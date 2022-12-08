import 'package:cloud_firestore/cloud_firestore.dart';
import '../entity/notes.dart';

class NoteRepository{
  //final _notes = <String, NoteEntity>{};
  late final CollectionReference _collection;

  NoteRepository(){
    /*_notes["Nota11"] = NoteEntity(name: "Nota11", image: "primeran.jpg", description: "Descripción nota1", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta1", userEMail: "usuario1@gmail.com");
    _notes["Nota12"] = NoteEntity(name: "Nota12", image: "segundan.jpg", description: "Descripción nota2", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta1", userEMail: "usuario1@gmail.com");
    _notes["Nota13"] = NoteEntity(name: "Nota13", image: "terceran.jpg", description: "Descripción nota3", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta1", userEMail: "usuario1@gmail.com");
    _notes["Nota14"] = NoteEntity(name: "Nota14", image: "cuartan.jpg", description: "Descripción nota4", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta1", userEMail: "usuario1@gmail.com");
    _notes["Nota15"] = NoteEntity(name: "Nota15", image: "quintan.jpg", description: "Descripción nota5", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta1", userEMail: "usuario1@gmail.com");
    _notes["Nota16"] = NoteEntity(name: "Nota16", image: "sextan.jpg", description: "Descripción nota6", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta1", userEMail: "usuario1@gmail.com");
    _notes["Nota21"] = NoteEntity(name: "Nota21", image: "primeran.jpg", description: "Descripción nota1", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta2", userEMail: "usuario1@gmail.com");
    _notes["Nota22"] = NoteEntity(name: "Nota22", image: "segundan.jpg", description: "Descripción nota2", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta2", userEMail: "usuario1@gmail.com");
    _notes["Nota23"] = NoteEntity(name: "Nota23", image: "terceran.jpg", description: "Descripción nota3", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta2", userEMail: "usuario1@gmail.com");
    _notes["Nota24"] = NoteEntity(name: "Nota24", image: "cuartan.jpg", description: "Descripción nota4", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta2", userEMail: "usuario1@gmail.com");*/
    _collection = FirebaseFirestore.instance.collection("notes");
  }

    Future<void> newNote(NoteEntity note) async {
    await _collection
      .withConverter<NoteEntity>(fromFirestore: NoteEntity.fromFirestore, toFirestore: (value, _) => value.toFirestore())
      .add(note);
      //.doc(folder.name)
      //.set(folder.toFirestore());
  }

  Future<List<NoteEntity>> getAllByUserEMailFolderId(String eMail, String id) async {
    var query = await _collection
      .where("userEMail", isEqualTo: eMail)
      .where("folderId", isEqualTo: id)
      .withConverter<NoteEntity>(fromFirestore: NoteEntity.fromFirestore, toFirestore: (value, _) => value.toFirestore())
      .get();

    //var folders = query.docs.cast();
    var notes = query.docs.cast().map<NoteEntity>((e){
      //print(e.id);
      var note = e.data();
      note.id = e.id;

      //folder.id = e.name;
      return note;
    });

    return notes.toList();
  }

  Future<NoteEntity> getById(String id) async {
  //Future<FolderEntity> getByName(String name) async {
    var snapshot = await _collection
      //.doc(name)
      .doc(id)
      .withConverter<NoteEntity>(fromFirestore: NoteEntity.fromFirestore, toFirestore: (value, _) => value.toFirestore())
      .get();

    var note = snapshot.data();
    if(note == null){
      return Future.error("No se encuentra la nota");
    }

    return note;
  }

  Future<void> update(NoteEntity note) async {
    await _collection
    //.doc(folder.name)
      .doc(note.id)
      .withConverter<NoteEntity>(fromFirestore: NoteEntity.fromFirestore, toFirestore: (value, _) => value.toFirestore())
      .set(note);
  }

  /*NoteEntity findByName (String name){
    var note = _notes[name];

    if(note == null){
      throw Exception("Nota no encontrada");
    }

    return note;
  }*/
}