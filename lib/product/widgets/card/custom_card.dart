import 'package:flutter/material.dart';

class CustomCardWidget extends StatefulWidget {
  const CustomCardWidget({Key? key, required this.widget}) : super(key: key);
  final Widget widget;

  @override
  State<CustomCardWidget> createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  late Widget _widget;

  @override
  void didUpdateWidget(covariant CustomCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.widget != oldWidget.widget) {
      _updateWidget();
    }
  }

  @override
  void initState() {
    super.initState();
    _widget = widget.widget;
  }

  void _updateWidget() {
    setState(() {
      _widget = widget.widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 10,
      shadowColor: Colors.transparent,
      borderOnForeground: true,
      semanticContainer: true,
      clipBehavior: Clip.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: EdgeInsets.zero,
      color: Colors.white,
      child: _widget,
    );
  }
}
