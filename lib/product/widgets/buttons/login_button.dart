import 'package:demorealcarpark/product/constants/color.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({ Key? key, required this.onCompleted, required this.title }) : super(key: key);

  final Future<void> Function() onCompleted;
  final String title;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _isLoading =false;

    void _changeLoading() {
    _isLoading = !_isLoading;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.teal),
        ),
       child: Center(
         child: _isLoading ? const CircularProgressIndicator(color: Colors.white,) : Text(widget.title),
       ),
       onPressed: () async{
         _changeLoading();
         await widget.onCompleted();
         _changeLoading();
       },),
    );
  }
}