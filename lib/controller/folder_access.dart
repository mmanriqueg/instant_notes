//import 'package:instant_notes/controller/request/folder_access_request.dart';
//import 'package:instant_notes/controller/response/folder_data.dart';
import 'package:instant_notes/model/entity/folders.dart';
import 'package:instant_notes/model/repository/folders_repository.dart';
import 'package:instant_notes/storage_repository.dart';

class FolderAccessController{

  late FolderRepository _repository;
  late FirebaseStorageRepository _storageRepository;

  FolderAccessController(){
    _repository = FolderRepository();
    _storageRepository = FirebaseStorageRepository();
  }

  Future<void> save(FolderEntity folder) async {
    if(folder.urlImage != null){
      //var url = await _storageRepository.loadFile(folder.urlImage!, "folder/urlImage");
      //var url = await _storageRepository.loadFile(folder.urlImage!, "${folder.userEMail!}/${folder.id!}");
      var url = await _storageRepository.loadFile(folder.urlImage!, folder.id!);
      //var url = await _storageRepository.loadFile(folder);
      folder.urlImage = url;
    }
    await _repository.newFolder(folder);
  }

  Future<void> updatePhoto(String id, String path) async {
    //var url = await _storageRepository.loadFile(path, "folder/urlImage");
    var folder = await _repository.getById(id);
    var url = await _storageRepository.loadFile(path, folder.id!);
    folder.urlImage = url;
    await _repository.update(folder);
  }

  Future<List<FolderEntity>> listAll(String eMail) async {
    return await _repository.getAllByUserEMail(eMail);
  }

 
}