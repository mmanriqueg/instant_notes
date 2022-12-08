//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FolderFileImageWidget extends StatefulWidget {
  //String? urlImage;
  
  const FolderFileImageWidget({super.key});

  @override
  State<FolderFileImageWidget> createState() => _FolderFileImageState();
}

class _FolderFileImageState extends State<FolderFileImageWidget> {
  late String? urlImage;
  late String? urlFolderImage;
  final _pref = SharedPreferences.getInstance();

  @override
  void initState(){
    super.initState();

    _pref.then((pref) {
      setState(() {
        //widget.urlImage = pref.getString("urlImage");
        urlImage = pref.getString("urlImage");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    XFile? pickedFile;

    return ElevatedButton(
      onPressed: () async {
        final mess = ScaffoldMessenger.of(context);
          //getImage;
          pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
            //widget.urlImage = pickedFile?.path;
            urlImage = pickedFile?.path;
            setState(() {
              urlFolderImage = urlImage;
            });
            var pref = await _pref;
            pref.setString("urlFolderImage", urlFolderImage!);
            if(urlFolderImage != null){
              mess.showSnackBar(
                const SnackBar(
                  content: Text("Imagen cargada"),
                ),
              );
            }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF676cc9),
      ),
      child: const Text("Cargar imagen"),
    );
  }

  /*String? getUrlImage(){
    return urlImage;
  }*/
}






/*import 'dart:io';
//import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:instant_notes/view/widgets/others.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import '../pages/take_photo.dart';
import 'package:image_picker/image_picker.dart';

class FolderFileImageWidget extends StatefulWidget {
  //Function? action;
  //String? urlImage;

  FolderFileImageWidget({super.key});

  @override
  State<FolderFileImageWidget> createState() => _FolderFileImageWidgetState();
}

class _FolderFileImageWidgetState extends State<FolderFileImageWidget> {
  File? imageFile;
  String? urlImage;
    final _pref = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();

    _pref.then((pref) {
      setState(() {
        widget.urlImage = pref.getString("urlImage");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Selecciona una imagen"),centerTitle: true,),
      body: Center(
        child: imageFile == null ? const Text("Selecciona una imagen") : /*getImage() : */enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: getImage,
        tooltip: "Busca la imagen",
        onPressed: uploadStatusImage(),
        child: const Icon(Icons.image_search),
      ),
    );
   //if(imageFile == null) ? Text("Selecciona una imagen.") : enableUpload;







/*

    Widget image;
    if (widget.urlImage == null) {


/*ElevatedButton(onPressed: () {
                  _folder.urlImage = _image.urlImage;
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF676cc9),
                  ),
                  child: const Text("Cargar imagen"),),*/


      //image = IconButton(
        image = ElevatedButton(
        onPressed: () async {
          final cameras = await availableCameras();
          final camera = cameras.first;
          var imagePath = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TakePhotoPage(camera: camera),
            ),
          );

          if (imagePath != null && imagePath.isNotEmpty) {
            setState(() {
              widget.urlImage = imagePath;
              if (widget.action != null) {
                widget.action!(imagePath);
              }
            });
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF676cc9),
        ),
        child: const Text("Cargar imagen"),
        );
        //icon: const Icon(Icons.camera_alt),
        //onPressed: () async {
          /*var nav = Navigator.of(context);

          final cameras = await availableCameras();
          final camera = cameras.first;

          var imagePath = await nav.push<String>(
            MaterialPageRoute(
              builder: (context) => TakePhotoPage(camera: camera),
            ),
          );

          if (imagePath != null && imagePath.isNotEmpty) {
            setState(() {
              widget.urlImage = imagePath;
              if (widget.action != null) {
                widget.action!(imagePath);
              }
            });
          }*/
        //},
      //);






    } else {
      ImageProvider provider;
      if (widget.urlImage!.startsWith("http")) {
        provider = NetworkImage(widget.urlImage!);
      } else {
        provider = FileImage(File(widget.urlImage!));
      }
      image = CircleAvatar(
        radius: 30,
        backgroundImage: provider,
      );
    }



    return imageFile;


*/

  }

  /*void saveToDatabase(String url){
    DatabaseReference ref = FirebaseDatabase.instance.reference();

  }*/

  void uploadStatusImage () async {
    final StorageReference postImageRef = FirebaseStorage.instance.ref().child("folders");
    var name = nombre;
    final StorageUploadTask uploadTask = postImageRef.child(name.toString()+".jpg").putFile(sampleImage);
    var urlImage = await (await uploadTask.onComplete).ref.getDownloadURL();
    url = urlImage.toString();
  }

  Widget enableUpload(){
    return Column(
      children: <Widget> [
        Image.file(imageFile),
        const VerticalSpace(height: 30),
        
    ]);
  }

  Future getImage() async{
    //var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    var tempImage = await ImagePicker().pickImage(source: ImageSource.gallery) as File;
    setState(() {
      imageFile = tempImage;
    });
  }


}

*/