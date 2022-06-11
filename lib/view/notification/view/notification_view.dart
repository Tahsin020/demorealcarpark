import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(
        'Notification Page',
        style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black),
      )),
    );
  }
}
