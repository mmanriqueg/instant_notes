import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:instant_notes/model/entity/notes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/note_access.dart';
import '../widgets/others.dart';
import '../widgets/text_fields.dart';
import '../widgets/headings.dart';
//import 'notes.dart';

class NewNotePage extends StatelessWidget {
  late final NoteAccessController _controller;
  final formKey = GlobalKey<FormState>();
  late final NoteEntity _note;
  final _pref = SharedPreferences.getInstance();

  NewNotePage({super.key}){
    _note = NoteEntity();
    _controller = NoteAccessController();
    _pref.then((pref){
    _note.userEMail = pref.getString("eMail");
    _note.folderId = pref.getString("id");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFc3c3c3),
      appBar: const GeneralAppBar(),
      drawer: GeneralDrawer(),
      body: Padding(padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              Row(children: [
                SizedBox(
                  height: 60,
                  child: Image.asset("assets/images/folders.jpg"),
                ),
                const HorizontalSpace(width: 10),
                const Text("Ejemplo",
                  style: TextStyle(
                    fontSize: 24,
                ),),
                const HorizontalSpace(width: 30),
                Row(children: const [
                  Text("Nueva nota",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],),
              ],),
              const VerticalSpace(height: 30),
              const StandardDivider(height: 10, thickness: 5,),
              const StandardDivider(height: 10, thickness: 5,),
              const VerticalSpace(height: 30),
              GeneralTextField(text: "Nombre", saving: (value){_note.name = value!;}),
              const VerticalSpace(height: 20),
              Row(children: [
                ElevatedButton(onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF676cc9),
                  ),

                  child: const Text("Cargar imagen"),),
              ],),
              const VerticalSpace(height: 20),
              LargeTextField(text: "Descripción",numLines: 4, saving: (value){_note.description = value!;}),
              const VerticalSpace(height: 20),
              Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                Column(children: [
                  Row(children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_rounded),tooltip: "Foto",),
                    const Text("Foto"),
                  ],),
                  Row(children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.voicemail),tooltip: "Nota de voz",),
                    const Text("Voz"),
                  ],),
                  Row(children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard),tooltip: "Entrada de texto",),
                    const Text("Texto"),
                  ],),
                ],),
                Column(children: [
                  Row(children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.video_call),tooltip: "Video",),
                    const Text("Video"),
                  ],),
                  Row(children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.cut),tooltip: "Captura de pantalla",),
                    const Text("Captura"),
                  ],),
                  Row(children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.draw),tooltip: "Entrada de lápiz",),
                    const Text("Dibujo"),
                  ],),
                ],),
              ],),                
              const VerticalSpace(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF676cc9),
                ),
                onPressed: () async {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    //_folder.urlImage = _image.urlImage;
                    try{
                      final mess = ScaffoldMessenger.of(context);
                      final nav = Navigator.of(context);
                      await _controller.save(_note);
                      //ScaffoldMessenger.of(context).showSnackBar(
                        mess.showSnackBar(
                        const SnackBar(
                          content: Text("Nota creada"),
                        ),
                      );
                      nav.pop();
                      //Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e"),),);
                    }
                  }
                },
                child: const Text("Guardar"),
              ),
            ],),
          ),
        ),
      )
    );
  }
}