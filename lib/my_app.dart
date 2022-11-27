import 'package:flutter/material.dart';
import 'view/pages/new_folder.dart';
import 'view/pages/new_note.dart';
import 'view/pages/start.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Instant Notes",
      home: StartPage(),
      initialRoute: '/',
      routes: {
        '/new_note': (context) => NewNotePage(),
        '/new_folder':(context) => NewFolderPage(),
      },
    );
  }
}
