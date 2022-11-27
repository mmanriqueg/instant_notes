import 'package:cloud_firestore/cloud_firestore.dart';
import '../entity/folders.dart';

class FolderRepository{
  //final _folders = <String, FolderEntity>{};
  late final CollectionReference _collection;

  FolderRepository(){
    /*_folders["Carpeta1"] = FolderEntity(name: "Carpeta1", urlImage: "primera.jpg", description: "Descripción carpeta1", userEMail: "usuario1@gmail.com");
    _folders["Carpeta2"] = FolderEntity(name: "Carpeta2", urlImage: "segunda.jpg", description: "Descripción carpeta2", userEMail: "usuario1@gmail.com");
    _folders["Carpeta3"] = FolderEntity(name: "Carpeta3", urlImage: "tercera.jpg", description: "Descripción carpeta3", userEMail: "usuario1@gmail.com");
    _folders["Carpeta4"] = FolderEntity(name: "Carpeta4", urlImage: "cuarta.jpg", description: "Descripción carpeta4", userEMail: "usuario1@gmail.com");
    _folders["Carpeta5"] = FolderEntity(name: "Carpeta5", urlImage: "quinta.jpg", description: "Descripción carpeta5", userEMail: "usuario1@gmail.com");
    _folders["Carpeta6"] = FolderEntity(name: "Carpeta6", urlImage: "sexta.jpg", description: "Descripción carpeta6", userEMail: "usuario1@gmail.com");
    _folders["Carpeta7"] = FolderEntity(name: "Carpeta7", urlImage: "séptima.jpg", description: "Descripción carpeta7", userEMail: "usuario1@gmail.com");
    _folders["Carpeta8"] = FolderEntity(name: "Carpeta8", urlImage: "octava.jpg", description: "Descripción carpeta8", userEMail: "usuario1@gmail.com");
    _folders["Carpeta9"] = FolderEntity(name: "Carpeta9", urlImage: "novena.jpg", description: "Descripción carpeta9", userEMail: "usuario1@gmail.com");
    _folders["Carpeta10"] = FolderEntity(name: "Carpeta10", urlImage: "décima.jpg", description: "Descripción carpeta10", userEMail: "usuario1@gmail.com");*/
    _collection = FirebaseFirestore.instance.collection("folders");
  }

  Future<void> newFolder(FolderEntity folder) async {
    await _collection
      .withConverter<FolderEntity>(fromFirestore: FolderEntity.fromFirestore, toFirestore: (value, _) => value.toFirestore())
      .add(folder);
      //.doc(folder.name)
      //.set(folder.toFirestore());
  }

  Future<List<FolderEntity>> getAllByUserEMail(String eMail) async {
    var query = await _collection
      .where("userEMail", isEqualTo: eMail)
      .withConverter<FolderEntity>(fromFirestore: FolderEntity.fromFirestore, toFirestore: (value, _) => value.toFirestore())
      .get();

    //var folders = query.docs.cast();
    var folders = query.docs.cast().map<FolderEntity>((e){
      //print(e.id);
      var folder = e.data();
      folder.id = e.id;

      //folder.id = e.name;
      return folder;
    });

    return folders.toList();
  }

  Future<FolderEntity> getById(String id) async {
  //Future<FolderEntity> getByName(String name) async {
    var snapshot = await _collection
      //.doc(name)
      .doc(id)
      .withConverter<FolderEntity>(fromFirestore: FolderEntity.fromFirestore, toFirestore: (value, _) => value.toFirestore())
      .get();

    var folder = snapshot.data();
    if(folder == null){
      return Future.error("No se encuentra la carpeta");
    }

    return folder;
  }

  Future<void> update(FolderEntity folder) async {
    await _collection
    //.doc(folder.name)
      .doc(folder.id)
      .withConverter<FolderEntity>(fromFirestore: FolderEntity.fromFirestore, toFirestore: (value, _) => value.toFirestore())
      .set(folder);
  }





  //FolderEntity findByName (String name){
  /*Future<FolderEntity> findByName (String name) async {
    final query = await _collection
      .where("name", isEqualTo: name)
      .withConverter(fromFirestore: FolderEntity.fromFirestore, toFirestore: (value, options) => value.toFirestore())
      .get();

    //var folder = _folders[name];
    var folders = await query.docs.cast().map((e) => e.data());

    //if(folder == null){
    if(folders.isEmpty){
      //throw Exception("Carpeta no encontrada");
      return Future.error("Carpeta no encontrada");
    }

    return folders.first;
  }

    Future<void> save(FolderEntity folder) async {
    //print(user);
    //await db.collection("users")
    await _collection
      //.withConverter(fromFirestore: UserEntity.fromFirestore, toFirestore: (value, options) => value.toFirestore())
      //.add(user);
      .doc(folder.name)
      .set(folder.toFirestore());
    /*await _collection.add(user.toFirestore());*/
  }*/
}