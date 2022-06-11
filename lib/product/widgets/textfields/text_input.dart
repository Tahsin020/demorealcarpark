import 'package:demorealcarpark/product/constants/color.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  TextInputField({ Key? key ,required this.icon,required this.hint,required this.controller,required this.isPasswordType}) : super(key: key);
  TextEditingController controller;
  bool isPasswordType;
  String hint;
  IconData icon;


  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(22)),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPasswordType,
        autocorrect: !widget.isPasswordType,
        enableSuggestions: !widget.isPasswordType,
        cursorColor: dataColors,
        keyboardType:  widget.isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
        style: const TextStyle(color: Colors.black,),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText:widget.hint,
          prefixIcon: Icon(widget.icon),
        ),
         onSaved: (value) {
          widget.controller.text= value!;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Bilgiyi Giriniz.";
          } else {
            return null;
          }
        },
      ),
    );
  }
}