import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/take_photo.dart';

class FolderFileImageWidget extends StatefulWidget {
  Function? action;
  String? urlImage;

  FolderFileImageWidget({super.key});

  @override
  State<FolderFileImageWidget> createState() => _FolderFileImageWidgetState();
}

class _FolderFileImageWidgetState extends State<FolderFileImageWidget> {
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

    return image;
  }
}

