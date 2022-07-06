import 'package:demorealcarpark/product/constants/color.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key, required this.callback}) : super(key: key);
  final Function()? callback;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late Function()? _callback;

  @override
  void didUpdateWidget(covariant MenuWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.callback != oldWidget.callback) {
      updateCallback();
    }
  }

  @override
  void initState() {
    super.initState();
    _callback = widget.callback;
  }

  void updateCallback() {
    setState(() {
      _callback = widget.callback;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        backgroundBlendMode: BlendMode.hardLight,
      ),
      //color: Colors.white,
      width: 40,
      height: 40,
      child: IconButton(
          onPressed: _callback,
          //icon: const Icon(Icons.format_align_justify_outlined, color: Colors.black)),
          icon: const Icon(Icons.menu_sharp, color: Color.fromARGB(255, 56, 82, 230))),
    );
  }
}
