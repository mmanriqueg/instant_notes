import '../../controller/response/user_data.dart';
import '../../model/entity/users.dart';
import '../auth_repository.dart';
import 'request/register_request.dart';
import 'request/log_in_request.dart';
import '../model/repository/users_repository.dart';

class LogInController{
  late final UserRepository _userRepository;
  late final FirebaseAuthenticationRepository _authRepository;

  LogInController(){
    _userRepository = UserRepository();
    _authRepository = FirebaseAuthenticationRepository();
  }

  Future<UserDataResponse> validateUser(LogInRequest request) async {
  //Future<String> validateUser(LogInRequest request) async {
    await _authRepository.signInEmailPassword(request.eMail, request.password);
    var user = await _userRepository.findByMail(request.eMail);

    /*if(user.password != request.password){
      throw Exception("Error: Revise la información ingresada.");
    }*/

    return UserDataResponse(
      eMail: user.eMail,
      userName: user.userName,
    );
  }

  //Future<void> registerNewUser(RegisterRequest request) async{
    //Future<void> registerNewUser(RegisterRequest request) {
    Future<void> registerNewUser(RegisterRequest request) async {
    //void registerNewUser(RegisterRequest request) {
    //try{
      await _authRepository.createEmailPasswordAccount(request.eMail, request.password);
      //await _authRepository.createEmailPasswordAccount(request.eMail, request.password).then(value);
      /*_authRepository.createEmailPasswordAccount(request.eMail, request.password).then((value){
        _userRepository.save(UserEntity(firstName: request.firstName, lastName: request.lastName, userName: request.userName, eMail: request.eMail/*, password: request.password*/));
      },
      onError: (error){
        throw error;
      });*/
    //};
      _userRepository.save(UserEntity(firstName: request.firstName, lastName: request.lastName, userName: request.userName, eMail: request.eMail/*, password: request.password*/));
    /*} catch (e){
      Future.error(e);
    }*/
  }

  Future<void> logout() async{
    await _authRepository.signOut();
  }
}