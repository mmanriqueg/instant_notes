import 'package:flutter/material.dart';

class GeneralTextField extends StatelessWidget {
  final String text;
  final FormFieldSetter<String?> saving;

  const GeneralTextField({super.key, required this.text, required this.saving});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: text,
            ),
            validator: (value) {
              if(value == null || value.isEmpty){
                return "Debes ingresar información de $text";
              }
              return null;
            },
            /*onSaved: (value) {
              _request.userName = value!;
            },*/
            onSaved: saving,
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final String text;
  final FormFieldSetter<String?> saving;

  const PasswordTextField({super.key, required this.text, required this.saving});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: text,
            ),
            validator: (value) {
              if(value == null || value.isEmpty){
                return "Debes ingresar información de $text";
              }
              if(value.length<3 || (!value.contains("1") && !value.contains("2") && !value.contains("3") && !value.contains("4") && !value.contains("5") && !value.contains("6") && !value.contains("7") && !value.contains("8") && !value.contains("9") && !value.contains("0"))){
                return "Mínimo 3 carácteres, mínimo 1 número.";
              }
              return null;
            },
            /*onSaved:(value) {
              _request.password = value!;
            },*/
            onSaved: saving,
          );
  }
}

class LargeTextField extends StatelessWidget {
  final String text;
  final int numLines;
  final FormFieldSetter<String?> saving;

  const LargeTextField({super.key, required this.text, required this.numLines, required this.saving});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: text,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: numLines,
            validator: (value) {
              if(value == null || value.isEmpty){
                return "Debes ingresar información de $text";
              }
              return null;
            },
            onSaved: saving,
    );
  }
}