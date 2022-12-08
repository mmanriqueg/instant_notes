import 'package:flutter/material.dart';
//import '../../model/repository/folders_repository.dart';
import '../../controller/folder_access.dart';
import '../../model/entity/folders.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/headings.dart';
//import '../widgets/buttons.dart';
import '../widgets/others.dart';
import 'notes.dart';

class FoldersPage extends StatefulWidget {
  const FoldersPage({super.key});

  @override
  State<FoldersPage> createState() => _FoldersPageState();
}

class _FoldersPageState extends State<FoldersPage>{
  List<FolderEntity> _list = [];
  final _pref = SharedPreferences.getInstance();
  final _folderAccessController = FolderAccessController();
  //String eMail = "";
  //final lista = _listFolders();

  @override
  void initState(){
    super.initState();
    _listFolders();
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFc3c3c3),
        appBar: const GeneralAppBar(),
        drawer: GeneralDrawer(),
        body: Padding(padding: const EdgeInsets.all(20.0),
          child: Column(children: [
              const VerticalSpace(height: 20),
              Row(children: const [
                Text("Carpetas",
                  style:TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],),
              const VerticalSpace(height: 35),
              Expanded(child: 
                ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index){
                    final folder = _list[index];

                    final CircleAvatar folderImage;
                      if (folder.urlImage != null) {
                        folderImage = CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(folder.urlImage!),
                        );
                      } else {
                        folderImage = const CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.folder_sharp),
                        );
                      }

                    return ListTile(
                      leading: folderImage,
                      title: Text(folder.name!),
                      subtitle: Text(folder.description!),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                        },),
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const NotesPage()));
                        var pref = await _pref;
                        pref.setString("id", folder.id!);
                      },
                    );
                  },
                ),
              ),
          ],),
        ),
        //floatingActionButton: AddButton(textToAdd: "Nueva carpeta", route: '/new_folder', func: _listFolders(), mount: !mounted,),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, '/new_folder');
            if(!mounted) return;
            _listFolders();
          },
          backgroundColor: const Color(0xFF16417c),
          tooltip: "Nueva carpeta",
          child: const Icon(Icons.add_circle_rounded)
        ),
        /*floatingActionButton: FloatingActionButton(onPressed: () async {
            await Navigator.pushNamed(context, '/new folder');
            if (!mounted) return;
            _listFolders();
          },
          tooltip: "Nueva carpeta",
          child: const Icon(Icons.add_circle_rounded),),*/
      ),
    );
  }

  void _listFolders(){
    _pref.then((pref){
      /*setState(() {
        eMail = pref.getString("eMail") ?? "N/A";
      });*/
      var eMail = pref.getString("eMail") ?? "";
      _folderAccessController.listAll(eMail).then((value){
        setState((){
          _list = value;
        });
      });
      //print(_list[0]);
    });
    //return List<String>.generate(10, (index) => "Carpeta ${index + 1}",);
  }
}