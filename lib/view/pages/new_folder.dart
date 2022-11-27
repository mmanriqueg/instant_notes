import 'package:flutter/material.dart';
import '../../controller/folder_access.dart';
import '../../model/entity/folders.dart';
import '../../view/widgets/others.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/folder_file_image.dart';
import '../widgets/headings.dart';
import '../widgets/text_fields.dart';
//import 'folders.dart';

class NewFolderPage extends StatelessWidget {
  late final FolderAccessController _controller;
  final formKey = GlobalKey<FormState>();
  late final FolderEntity _folder;
  final _pref = SharedPreferences.getInstance();
  late final FolderFileImageWidget _image;
  
  NewFolderPage({super.key}){
    _folder = FolderEntity();
    _controller = FolderAccessController();
    _pref.then((pref){
      _folder.userEMail = pref.getString("eMail");
    });
    _image = FolderFileImageWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(195, 195, 195, 1),
      appBar: const GeneralAppBar(),
      drawer: GeneralDrawer(),
      body: Padding(padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              const Text("Nueva carpeta",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const VerticalSpace(height: 30),
              GeneralTextField(text: "Nombre", saving: (value){_folder.name = value!;}),
              const VerticalSpace(height: 10),
              Row(children: [
                FolderFileImageWidget(),


                /*ElevatedButton(onPressed: () {
                  _folder.urlImage = _image.urlImage;
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF676cc9),
                  ),
                  child: const Text("Cargar imagen"),),*/





              ],),
              const VerticalSpace(height: 10),
              LargeTextField(text: "Descripción",numLines: 4, saving: (value){_folder.description = value!;}),
              const VerticalSpace(height: 35),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF676cc9),
                ),
                onPressed: () async {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    _folder.urlImage = _image.urlImage;
                    try{
                      await _controller.save(_folder);
                      //print(_folder.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Carpeta creada"),
                        ),
                      );
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => const FoldersPage()));
                      Navigator.pop(context);
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
      ),
    );
  }
}