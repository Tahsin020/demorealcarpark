import 'package:demorealcarpark/view/notification/view/notification_view.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 14,
        top: 30,
        child: Container(
          color: Colors.transparent,
          height: 40,
          width: 40,
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NotificationView(),
                ));
              },
              icon: const Icon(Icons.notification_important_outlined)),
        ));
  }
}
