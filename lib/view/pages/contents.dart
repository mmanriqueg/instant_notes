import 'package:flutter/material.dart';
import '../widgets/others.dart';
import '../widgets/headings.dart';

class ContentsPage extends StatelessWidget {
  const ContentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFc3c3c3),
      appBar: const GeneralAppBar(),
      drawer: GeneralDrawer(),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(children: [
              Row(children: [
                SizedBox(
                  height: 60,
                  child: Image.asset("assets/images/folders.jpg"),),
                const HorizontalSpace(width: 10),
                const Text("Ejemplo",
                  style: TextStyle(
                    fontSize: 24,
                  ),),
                const HorizontalSpace(width: 30),
              ],),
              Row(children: [
                SizedBox(
                  height: 50,
                  child: Image.asset("assets/images/notes.jpg"),),
                const Text("Basics",
                  style: TextStyle(
                    fontSize: 20,
                  ),),
              ],),
            ],),
            const VerticalSpace(height: 30),
            const StandardDivider(height: 10, thickness: 5,),
            const StandardDivider(height: 10, thickness: 5,),
            const VerticalSpace(height: 30),
            const Text("Este es un texto de ejemplo para un primer elemento llamado Basics, de la carpeta Ejemplo.",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,),
            const VerticalSpace(height: 20),
            Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  Row(children: [
                    IconButton(onPressed: () {}, icon: Image.asset("assets/images/gg_bridge.jpg"),tooltip: "Foto",),
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
              ],
            ),    
          ],),
        ), 
      )
    );
  }
}