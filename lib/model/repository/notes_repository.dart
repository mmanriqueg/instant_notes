import '../entity/notes.dart';

class NoteRepository{
  final _notes = <String, NoteEntity>{};

  NoteRepository(){
    _notes["Nota11"] = NoteEntity(name: "Nota11", image: "primeran.jpg", description: "Descripción nota1", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta1", userEMail: "usuario1@gmail.com");
    _notes["Nota12"] = NoteEntity(name: "Nota12", image: "segundan.jpg", description: "Descripción nota2", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta1", userEMail: "usuario1@gmail.com");
    _notes["Nota13"] = NoteEntity(name: "Nota13", image: "terceran.jpg", description: "Descripción nota3", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta1", userEMail: "usuario1@gmail.com");
    _notes["Nota14"] = NoteEntity(name: "Nota14", image: "cuartan.jpg", description: "Descripción nota4", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta1", userEMail: "usuario1@gmail.com");
    _notes["Nota15"] = NoteEntity(name: "Nota15", image: "quintan.jpg", description: "Descripción nota5", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta1", userEMail: "usuario1@gmail.com");
    _notes["Nota16"] = NoteEntity(name: "Nota16", image: "sextan.jpg", description: "Descripción nota6", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta1", userEMail: "usuario1@gmail.com");
    _notes["Nota21"] = NoteEntity(name: "Nota21", image: "primeran.jpg", description: "Descripción nota1", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta2", userEMail: "usuario1@gmail.com");
    _notes["Nota22"] = NoteEntity(name: "Nota22", image: "segundan.jpg", description: "Descripción nota2", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta2", userEMail: "usuario1@gmail.com");
    _notes["Nota23"] = NoteEntity(name: "Nota23", image: "terceran.jpg", description: "Descripción nota3", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta2", userEMail: "usuario1@gmail.com");
    _notes["Nota24"] = NoteEntity(name: "Nota24", image: "cuartan.jpg", description: "Descripción nota4", photo: "enlace", voiceNote: "enlace", text: "enlace", video: "enlace", screenShot: "enlace", drawing: "enlace", folderName: "Carpeta2", userEMail: "usuario1@gmail.com");
  }

  NoteEntity findByName (String name){
    var note = _notes[name];

    if(note == null){
      throw Exception("Nota no encontrada");
    }

    return note;
  }
}