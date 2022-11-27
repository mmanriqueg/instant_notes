import 'package:cloud_firestore/cloud_firestore.dart';
import '../entity/users.dart';

class UserRepository{
  //late final FirebaseFirestore db;
  late final CollectionReference _collection;
  //final _users = <String, UserEntity>{};

  UserRepository(){
    //db = FirebaseFirestore.instance;
    //final db = FirebaseFirestore.instance;
    _collection = FirebaseFirestore.instance.collection("users");
    /*_users["usuario1@gmail.com"] = UserEntity(firstName: "Usuario1", lastName: "Primero", userName: "user1", eMail: "usuario1@gmail.com", /*password: "contraseña1"*/);
    _users["usuario2@gmail.com"] = UserEntity(firstName: "Usuario2", lastName: "Segundo", userName: "user2", eMail: "usuario2@gmail.com", /*password: "contraseña2"*/);
    _users["usuario3@gmail.com"] = UserEntity(firstName: "Usuario3", lastName: "Tercero", userName: "user3", eMail: "usuario3@gmail.com", /*password: "contraseña3"*/);
    _users["usuario4@gmail.com"] = UserEntity(firstName: "Usuario4", lastName: "Cuarto", userName: "user4", eMail: "usuario4@gmail.com", /*password: "contraseña4"*/);*/
  }

  Future<UserEntity> findByMail (String eMail) async {
    //var user = await db.collection("users").doc(eMail).get();
    final query = await _collection
    //var user = await _collection
    .where("eMail", isEqualTo: eMail)
    .withConverter(fromFirestore: UserEntity.fromFirestore, toFirestore: (value, options) => value.toFirestore())
    //.doc(eMail)
    .get();
    //var user = _users[eMail];

    /*if(user == null){
      throw Exception("Usuario no ncontrado");
    }*/

    //var users = await query.docs.cast();
    var users = await query.docs.cast().map((e) => e.data());

    if(users.isEmpty){
      return Future.error("Usuario no encontrado");
    }

    //return user;*/
    //return UserEntity();
    //return users.first.data();
    return users.first;
  }

  Future<void> save(UserEntity user) async {
    //print(user);
    //await db.collection("users")
    await _collection
      //.withConverter(fromFirestore: UserEntity.fromFirestore, toFirestore: (value, options) => value.toFirestore())
      //.add(user);
      .doc(user.eMail)
      .set(user.toFirestore());
    /*await _collection.add(user.toFirestore());*/
  }
  /*void save(UserEntity user){
  //print(user);
    db.collection("users")
    .add(user.toFirestore());
  }*/
}