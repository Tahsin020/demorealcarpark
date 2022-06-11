import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget({ Key? key,required this.callback }) : super(key: key);
  final Function()? callback;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late Function()? _callback;

@override
  void didUpdateWidget(covariant MenuWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.callback != oldWidget.callback){
      updateCallback();
    }
  }

  @override
  void initState() {
    super.initState();
    _callback=widget.callback;
  }

  void updateCallback(){
    setState(() {
      _callback=widget.callback;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
            left: 14,
            top: 30,
            child: Container(
              color: Colors.white,
              width: 40,
              height: 40,
              child: IconButton(
                  onPressed: _callback,
                  //icon: const Icon(Icons.format_align_justify_outlined, color: Colors.black)),
                  icon: const Icon(Icons.menu_sharp,color: Colors.black)),
            ),
          );
  }
}