import 'package:instant_notes/model/entity/notes.dart';
import 'package:instant_notes/model/repository/notes_repository.dart';
//import 'package:instant_notes/storage_repository.dart';

class NoteAccessController{

  late NoteRepository _repository;
  //late FirebaseStorageRepository _storageRepository;

  NoteAccessController(){
    _repository = NoteRepository();
//    _storageRepository = FirebaseStorageRepository();
  }

  Future<void> save(NoteEntity note) async {
    if(note.urlImage != null){
      //var url = await _storageRepository.loadFile(note.urlImage!, "folder/note/urlImage");
      /*var url = await _storageRepository.loadFile(note.urlImage!, note.id!);
      note.urlImage = url;*/
    }
    await _repository.newNote(note);
  }

  Future<void> updatePhoto(String id, String path) async {
    /*var url = await _storageRepository.loadFile(path, "folder/urlImage");
    var note = await _repository.getById(id);
    note.urlImage = url;
    await _repository.update(note);*/
  }

  Future<List<NoteEntity>> listAll(String eMail, String id) async {
    return await _repository.getAllByUserEMailFolderId(eMail, id);
  }
}