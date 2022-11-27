//import 'dart:html';

class RegisterRequest{
  late String firstName;
  late String lastName;
  late String userName;
  late String eMail;
  late String password;

  @override
  String toString(){
    return "$firstName, $lastName, $userName, $eMail, $password";
  }
}