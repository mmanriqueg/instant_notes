import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationRepository{
  Future<void> createEmailPasswordAccount(String eMail, String password) async{
    try {
      //final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: eMail,
        password: password,
      );
      //print(credential);
    } on FirebaseAuthException catch (e){
      if(e.code == 'weak-password'){
        return Future.error('La contraseña es muy débil.');
        //throw Exception('La contraseña es muy débil.');
      } else if(e.code == 'email-already-in-use'){
        return Future.error('La cuenta ya existe para ese correo electrónico.');
        //throw Exception('La cuenta ya existe para ese correo electrónico.');
      }
    } /*catch (e){
      print(e);
    }*/
  }

  Future<void> signInEmailPassword(String eMail, String password) async {
    try{
      /*final credential =*/ await FirebaseAuth.instance.signInWithEmailAndPassword(email: eMail, password: password);
      //print(credential);
    } on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        return Future.error('Usuario no encontrado.');
      } else if(e.code == 'wrong-password'){
        return Future.error('La contraseña no corresponde.');
      }
    }
  }

  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}

/*abstract class AuthRepository{
  const AuthRepository();

  Future<UserCredential> signInWithEmail(
    final String userName,
    final String password,
  ){
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: userName, password: password);
  }
}*/