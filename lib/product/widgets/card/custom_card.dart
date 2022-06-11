import 'package:flutter/material.dart';

class CustomCardWidget extends StatefulWidget {
  CustomCardWidget({ Key? key ,required this.widget}) : super(key: key);
  Widget widget;

  @override
  State<CustomCardWidget> createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        shadowColor: Colors.transparent,
        borderOnForeground: true,
        semanticContainer: true,
        clipBehavior: Clip.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        margin: EdgeInsets.zero,
        color: Colors.black54.withOpacity(0.6),
        child: widget.widget,
    );
  }
}