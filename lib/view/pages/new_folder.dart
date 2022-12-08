import 'package:flutter/material.dart';
import 'package:instant_notes/controller/folder_access.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/entity/folders.dart';
import '../widgets/folder_file_image.dart';
import '../widgets/headings.dart';
import '../widgets/others.dart';
import '../widgets/text_fields.dart';

class NewFolderPage extends StatelessWidget {
  final _pref = SharedPreferences.getInstance();
  late final FolderEntity _folder;
  late final FolderAccessController _controller;
  //late final FolderFileImageWidget _image;

  NewFolderPage({super.key}) {
    _folder = FolderEntity();
    _controller = FolderAccessController();
    _pref.then((pref){
      _folder.userEMail = pref.getString("eMail");
    });
    //_image = FolderFileImageWidget();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
              Row(children: const [
                FolderFileImageWidget(),
                //_image = const FolderFileImageWidget(),
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
                    //_folder.urlImage = _image.urlImage;
                    _pref.then((pref){
                      _folder.urlImage = pref.getString("urlFolderImage");
                    });
                    //_folder.urlImage = _image.urlImage;
                    try{
                      final mess = ScaffoldMessenger.of(context);
                      final nav = Navigator.of(context);
                      mess.showSnackBar(SnackBar(content: Text("Url: ${_folder.urlImage}"),),);
                      await _controller.save(_folder);
                      //print(_folder.id);
                      //ScaffoldMessenger.of(context).showSnackBar(
                      mess.showSnackBar(
                        const SnackBar(
                          content: Text("Carpeta creada"),
                        ),
                      );
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => const FoldersPage()));
                      //Navigator.pop(context);
                      nav.pop();
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





















/*import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/folder_access.dart';
import '../../model/entity/folders.dart';
import '../../view/widgets/others.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import '../widgets/folder_file_image.dart';
import '../widgets/headings.dart';
import '../widgets/text_fields.dart';
//import 'folders.dart';

class NewFolderPage extends StatefulWidget {
  const NewFolderPage({super.key});

  @override
  State<NewFolderPage> createState() => _NewFolderPageState();
}

class _NewFolderPageState extends State<NewFolderPage>{


//class NewFolderPage extends StatelessWidget {
  //late final FolderAccessController _controller;
  final _controller = FolderAccessController();
  final formKey = GlobalKey<FormState>();
  //late final FolderEntity _folder;
  late final _folder = FolderEntity();
  final _pref = SharedPreferences.getInstance();
  
  //late final FolderFileImageWidget _image;
  //late File sampleImage;

  //NewFolderPage({super.key}){
  //  _folder = FolderEntity();
   // _controller = FolderAccessController();
    //_pref.then((pref){
    //  _folder.userEMail = pref.getString("eMail");
    //});
    //_image = FolderFileImageWidget();
  //}

  @override
  void initState(){
    super.initState();
    _pref.then((pref){
      _folder.userEMail = pref.getString("eMail");
    });
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
                /*FolderFileImageWidget(),*/


                ElevatedButton(onPressed: () {
                  //getImage();
                  //getImage(_folder.name);
                  _folder.urlImage = getImage("${_folder.userEMail}+/+${_folder.name}").toString();
                  //uploadStatusImage(_folder.name);
                  /*_folder.urlImage = uploadStatusImage(_folder.name).toString();*/
                  /*_folder.urlImage = _image.urlImage;*/
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF676cc9),
                  ),
                  child: const Text("Cargar imagen"),),


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
                    //_folder.urlImage = _image.urlImage;
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

  /*Future<String> uploadStatusImage (String? folderName) async {
    //final StorageReference postImageRef = FirebaseStorage.instance.ref().child("folders");
    final postImageRef = FirebaseStorage.instance.ref().child("folders");
    var name = folderName;
    //final StorageUploadTask uploadTask = postImageRef.child(name.toString()+".jpg").putFile(sampleImage);
    //final uploadTask = postImageRef.child(name.toString()+".jpg").putFile(imageFile);
    postImageRef.child(name.toString()+".jpg").putFile(sampleImage);
    //var urlImage = await (await uploadTask.onComplete.ref.getDownloadURL();
    var urlImage = await postImageRef.getDownloadURL();
    var url = urlImage.toString();
    return url;
  }*/

  /*Widget enableUpload(){
    return Column(
      children: <Widget> [
        Image.file(imageFile),
        const VerticalSpace(height: 30),
        
    ]);
  }*/

  Future<String> getImage(String? folderName) async{
    //var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    //var tempImage = await ImagePicker().pickImage(source: ImageSource.gallery) as PickedFile;
    PickedFile pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery) as PickedFile;
    var tempImage = File(pickedFile.path);
    /*_pref.then((pref){
      setState((){
        //imageFile = tempImage;
        sampleImage = tempImage;
      });
    });*/
    final postImageRef = FirebaseStorage.instance.ref().child("folders");
    var name = folderName;
    //final StorageUploadTask uploadTask = postImageRef.child(name.toString()+".jpg").putFile(sampleImage);
    //final uploadTask = postImageRef.child(name.toString()+".jpg").putFile(imageFile);
    postImageRef.child(name.toString()+".jpg").putFile(tempImage);
    //var urlImage = await (await uploadTask.onComplete.ref.getDownloadURL();
    var urlImage = await postImageRef.getDownloadURL();
    var url = urlImage.toString();
    return url;



      //print(_list[0]);

  }


    /*setState(() {
      imageFile = tempImage;
    });*/
}
*/