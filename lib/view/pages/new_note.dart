import 'package:flutter/material.dart';
import 'package:instant_notes/model/entity/notes.dart';
import '../widgets/others.dart';
import '../widgets/text_fields.dart';
import '../widgets/headings.dart';
import 'notes.dart';

class NewNotePage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  late final NoteEntity _note;

  NewNotePage({super.key}){
    _note = NoteEntity();
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
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Nota creada"),
                      ),
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NotesPage()));
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