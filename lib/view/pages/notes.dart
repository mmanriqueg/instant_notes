import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/note_access.dart';
import '../../model/entity/notes.dart';
import '../widgets/others.dart';
import 'contents.dart';
import '../widgets/headings.dart';
//import '../widgets/buttons.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>{
  List<NoteEntity> _list = [];
  final _pref = SharedPreferences.getInstance();
  final _noteAccessController = NoteAccessController();

   @override
  void initState(){
    super.initState();
    _listNotes();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFc3c3c3),
        appBar: const GeneralAppBar(),
        drawer: GeneralDrawer(),
        body: Padding(padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(children: [
              SizedBox(
                height: 60,
                child: Image.asset("assets/images/folders.jpg"),),
              const HorizontalSpace(width: 30),
              const Text("Ejemplo",
                style: TextStyle(
                  fontSize: 24,),),
            ],),
            const VerticalSpace(height: 30),
            const StandardDivider(height: 10, thickness: 5,),
            const StandardDivider(height: 10, thickness: 5,),
            const VerticalSpace(height: 30),
            Expanded(
                child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index){
                    final note = _list[index]; 
                    return ListTile(
                      leading: Image.asset("assets/images/notes.jpg"),
                      title: Text(note.name!),
                      subtitle: Text(note.description!),
                      trailing: IconButton(icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {},),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ContentsPage()));
                      },
                    );
                  }
                ),
            ),
          ]),
        ),
        //floatingActionButton: AddButton(textToAdd: "Agregar nota", route: '/new_note', func: _listNotes(), mount: !mounted,),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, '/new_note');
            if(!mounted) return;
            _listNotes();
          },
          backgroundColor: const Color(0xFF16417c),
          tooltip: "Agregar nota",
          child: const Icon(Icons.add_circle_rounded)
        ),
      ),
    );
    //final lista = _listNotes();

    //return 
  }

    void _listNotes(){
    _pref.then((pref){
      /*setState(() {
        eMail = pref.getString("eMail") ?? "N/A";
      });*/
      var eMail = pref.getString("eMail") ?? "";
      var id = pref.getString("id") ?? "";
      _noteAccessController.listAll(eMail,id).then((value){
        setState((){
          _list = value;
        });
      });
      //print(_list[0]);
    });
    //return List<String>.generate(10, (index) => "Carpeta ${index + 1}",);
  }


  /*List <String> _listNotes(){
    return List<String>.generate(10, (index) => "Nota ${index + 1}",);
  }*/
}