import 'package:demorealcarpark/product/constants/color.dart';
import 'package:flutter/material.dart';

class HeaderContainer extends StatefulWidget {
  const HeaderContainer({Key? key,required this.title, required this.onPressed}) : super(key: key);
  final String title;
  final Future<void> Function()? onPressed;

  @override
  State<HeaderContainer> createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  late String _title;
  late Future<void> Function()? _onPressed;
  final String _imageUrl='assets/dataMedium.png';

  @override
  void didUpdateWidget(covariant HeaderContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.title != oldWidget.title && widget.onPressed != oldWidget.onPressed) {
      _updateWidget();
    }
  }

  @override
  void initState() {
    super.initState();
    _title=widget.title;
    _onPressed=widget.onPressed;
  }

  void _updateWidget(){
    setState(() {
      _title = widget.title;
      _onPressed=widget.onPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [dataTurquosieColors,dataColors,],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          // Positioned(
          //   top: 20,
          //   left: 20,
          //   child: IconButton(
          //     onPressed: (){
          //       _onPressed!();
          //     }, 
          //     icon: const Icon(Icons.west,color: Colors.white,)),
          // ),
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                _title,
                style:const TextStyle(color: Colors.white,fontSize: 20),
              )),
          Center(
            child: Image.asset(_imageUrl),
          ),
        ],
      ),
    );
  }
}