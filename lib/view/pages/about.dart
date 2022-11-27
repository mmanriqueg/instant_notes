import 'package:flutter/material.dart';
import '../widgets/headings.dart';
import '../widgets/others.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFc3c3c3),
      appBar: const GeneralAppBar(),
      body: Padding(padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(children: const [
            VerticalSpace(height: 10),
            Text("Acerca de nosotros",
              style: TextStyle(
                fontSize: 25,
              )),
            VerticalSpace(height: 30),
            Text("MLMG Corp es un equipo de desarrollo de aplicaciones de escritorio, web y móviles.",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,),
            VerticalSpace(height: 25),
            Text("Hemos desarrollado diversas aplicaciones con fines educativos, como BuscArte.",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,),
            VerticalSpace(height: 25),
            Text("Instant Notes llega como una solución para conservar las ideas, si estamos en la calle, o para registrarlas cuando las queremos dejar en remojo para después.",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,),
          ],),
        ), 
      ),
    );
  }
}