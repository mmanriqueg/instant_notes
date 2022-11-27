import 'package:flutter/material.dart';
import '../pages/about.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
      },
      tooltip: "Acerca de nosotros",
      backgroundColor: const Color(0xFF16417c),
      child: const Icon(Icons.info),
    );
  }
}

class AddButton extends StatelessWidget {
  final String textToAdd;
  final String route;
    
  const AddButton({super.key, required this.textToAdd, required this.route});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      backgroundColor: const Color(0xFF16417c),
      tooltip: textToAdd,
      child: const Icon(Icons.add_circle_rounded)
    );
  }
}

