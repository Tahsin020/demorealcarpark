import 'package:demorealcarpark/product/constants/color.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  const TextInputField(
      {Key? key, required this.icon, required this.hint, required this.controller, required this.isPasswordType})
      : super(key: key);
  final TextEditingController controller;
  final bool isPasswordType;
  final String hint;
  final IconData icon;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late TextEditingController _controller;
  late bool _isPasswordType;
  late String _hint;
  late IconData _icon;

  @override
  void didUpdateWidget(covariant TextInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPasswordType != oldWidget.isPasswordType &&
        widget.hint != oldWidget.hint &&
        widget.icon != oldWidget.icon &&
        widget.controller != oldWidget.controller) {
      _updateWidget();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _isPasswordType = widget.isPasswordType;
    _hint = widget.hint;
    _icon = widget.icon;
  }

  void _updateWidget() {
    setState(() {
      _controller = widget.controller;
      _isPasswordType = widget.isPasswordType;
      _hint = widget.hint;
      _icon = widget.icon;
    });
  }

  final String _info = 'Bilgiyi Giriniz.';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(22)),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: _controller,
        obscureText: _isPasswordType,
        autocorrect: !_isPasswordType,
        enableSuggestions: !_isPasswordType,
        cursorColor: dataColors,
        keyboardType: _isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hint,
          prefixIcon: Icon(_icon),
        ),
        onSaved: (value) {
          _controller.text = value!;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return _info;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
