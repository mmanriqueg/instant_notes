import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/log_in.dart';
import '../../controller/request/log_in_request.dart';
import '../widgets/headings.dart';
import '../widgets/buttons.dart';
import '../widgets/text_fields.dart';
import '../widgets/others.dart';
import 'folders.dart';
import 'registration.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class StartPage extends StatelessWidget {
  final _pref = SharedPreferences.getInstance();
  final formKey = GlobalKey<FormState>();
  late final LogInRequest _request;
  late final LogInController _controller;

  StartPage({super.key}){
    _controller = LogInController();
    _request = LogInRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFc3c3c3),
      appBar: const GeneralAppBar(),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Expanded(child: 
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(children: [
                const VerticalSpace(height: 30),
                const Text("Inicio de sesión",
                  style: TextStyle(
                    fontSize: 28,
                ),),
                const VerticalSpace(height: 30),
                GeneralTextField(text: "Correo electrónico", saving: (value){_request.eMail = value!;}),
                const VerticalSpace(height: 16),
                PasswordTextField(text: "Contraseña", saving: (value){_request.password = value!;}),
                const VerticalSpace(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF676cc9),
                  ),
                  onPressed: () async {
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      try{
                        final nav = Navigator.of(context);
                        var userData = await _controller.validateUser(_request);
                        var pref = await _pref;
                        pref.setString("eMail", userData.eMail!);
                        pref.setString("userName", userData.userName!);
                        /*final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _request.eMail,
                          password: _request.password,
                        );*/
                        //var userName = _controller.validateUser(_request);
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => const FoldersPage(/*eMail: request.eMail, password: _request.password*/)));
                        nav.push(MaterialPageRoute(builder: (context) => const FoldersPage()));
                      /*} on FirebaseAuthException catch (e) {
                        if(e.code == 'user-not-found'){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Usuario no encontrado')));
                        } else if(e.code == 'wrong-password'){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Contraseña incorrecta')));
                        }*/
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                        //showDialog(context: context, builder: (context) => AlertDialog(title: const Text("Ventas"),content: Text(e.toString()),),);
                      }
                    }
                  },
                  child: const Text("Ingresar",
                  style: TextStyle(
                    fontSize: 15,
                  )),),
                const VerticalSpace(height: 30),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage(/*userName: _request.userName,password: _request.password*/)));
                  },
                  child: const Text("¿No tienes una cuenta? Regístrate",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    color: Colors.black,
                  ),),
                ),
                const VerticalSpace(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF676cc9),
                  ),
                  onPressed: () {},
                  child: const Text("Acceder con cuenta de Google",
                  style: TextStyle(
                    fontSize: 15,
                  )),
                ),
              ],),
            ),
          ),
        ),
      ),
      floatingActionButton: const InfoButton(),
    );
  }
}