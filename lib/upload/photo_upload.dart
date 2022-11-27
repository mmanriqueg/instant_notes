//import 'dart:html';
/*import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PhotoUpload extends StatefulWidget {
  const PhotoUpload({super.key});

  @override
  State<PhotoUpload> createState() => _PhotoUploadState();
  //_PhotoUploadState createState() => _PhotoUploadState();
}

class _PhotoUploadState extends State<PhotoUpload> {
  File sampleImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Image"), centerTitle: true,),
      body: Center(
        child: sampleImage==null ? const Text("Seleccione una imagen"): enableUpload,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage(),
      tooltip: "Agregar imagen",
      child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  Future getImage() async{
    var tempImage = await ImagePicker.pick(source: ImageSource.gallery);
    setState(() {
      sampleImage = tempImage;
    });
  }
}*/