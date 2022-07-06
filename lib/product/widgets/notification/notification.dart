import 'package:demorealcarpark/view/notification/view/notification_view.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key,required this.onPressed}) : super(key: key);
  final Future<void> Function()? onPressed;

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late Future<void> Function()? _onPressed;

  @override
  void didUpdateWidget(covariant NotificationWidget oldWidget) {
     super.didUpdateWidget(oldWidget);
     if (widget.onPressed != oldWidget.onPressed) {
       _updateWidget();
     }
  }
  
  @override
  void initState() {
    super.initState();
    _onPressed=widget.onPressed;
  }

  void _updateWidget(){
    setState(() {
      _onPressed=widget.onPressed;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 40,
      width: 40,
      child: IconButton(
          onPressed: () {
             _onPressed!();
          },
          icon: const Icon(Icons.notification_important_outlined)),
    );
  }
}
