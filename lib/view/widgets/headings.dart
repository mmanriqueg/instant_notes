import 'package:flutter/material.dart';
import 'package:instant_notes/controller/log_in.dart';
import 'package:instant_notes/view/widgets/others.dart';
import '../pages/about.dart';
import '../pages/new_folder.dart';
import '../pages/start.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GeneralAppBar ({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              icon: Image.asset("assets/images/notes.jpg"),
              onPressed: (){Scaffold.of(context).openDrawer();},
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text("Instant Notes"),
        backgroundColor: const Color(0xFF16417c),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class GeneralDrawer extends StatelessWidget {
  GeneralDrawer ({super.key});
  final _controller = LogInController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF676cc9),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 80,
                  child: Image.asset("assets/images/notes.jpg"),
                ),
                const HorizontalSpace(width: 20),
                const Text("Menú",
                  style: TextStyle(
                    color: Color(0xFFc3c3c3),
                    fontSize: 24,
                  ),
                ),
            ],),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_rounded),
            title: const Text("Nueva carpeta"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewFolderPage()));
            },
          ),
          const StandardDivider(height: 50, thickness: 1),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text("Cerrar sesión"),
            onTap: () {
              _controller.logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StartPage()));
            },
          ),
          const StandardDivider(height: 50, thickness: 1),
          ListTile(
            leading: const Icon(Icons.handshake),
            title: const Text("Acerca de nosotros"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
            },
          ),
        ],
      ),
    );
  }
}
