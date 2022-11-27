//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:instant_notes/controller/log_in.dart';
import '../../controller/request/register_request.dart';
import '../widgets/headings.dart';
import '../widgets/buttons.dart';
import '../widgets/text_fields.dart';
import '../widgets/others.dart';
//import {getAuth, createUserWithEmailAndPassword} from 'firebase/auth';
//'package:firebase_auth/firebase_auth.dart';

class RegistrationPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  /*final String userName;
  final String password;*/
  late RegisterRequest _data;
  late LogInController _controller;

  RegistrationPage({super.key/*, required this.userName, required this.password*/}){
    _data = RegisterRequest();
    _controller = LogInController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFc3c3c3),
      appBar: const GeneralAppBar(),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(children: [
                const VerticalSpace(height: 10),
                const Text("¡Regístrate!",
                  style: TextStyle(
                    fontSize: 32,
                ),),
                const VerticalSpace(height: 30),
                GeneralTextField(text: "Nombres", saving: (newValue){_data.firstName = newValue!;}),
                const VerticalSpace(height: 30),
                GeneralTextField(text: "Apellidos", saving: (newValue){_data.lastName = newValue!;}),
                const VerticalSpace(height: 30),
                GeneralTextField(text: "Nombre de usuario", saving: (newValue){_data.userName = newValue!;}),
                const VerticalSpace(height: 30),
                GeneralTextField(text: "Correo electrónico", saving: (newValue){_data.eMail = newValue!;}),
                const VerticalSpace(height: 30),
                PasswordTextField(text: "Contraseña", saving: (newValue){_data.password = newValue!;}),
                const VerticalSpace(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF676cc9),
                  ),
                  //onPressed: () async {
                  onPressed: () async {
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      try{
                        await _controller.registerNewUser(_data);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Usuario registrado con éxito")));
                        Navigator.pop(context);
                      }catch(error){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
                      }
                     
                      /*_controller.registerNewUser(_data).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Usuario registrado con éxito")));
                        Navigator.pop(context);
                      },
                      onError: (error){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
                      });*/
                      //print(_data);
                    }
                  },
                  child: const Text("Guardar"),
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