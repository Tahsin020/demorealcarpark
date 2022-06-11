import 'package:demorealcarpark/product/constants/color.dart';
import 'package:demorealcarpark/view/userMap/view/user_map_view.dart';
import 'package:flutter/material.dart';

class HeaderContainer extends StatefulWidget {
  var text = "Login";

  HeaderContainer(this.text, {Key? key}) : super(key: key);

  @override
  State<HeaderContainer> createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
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
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UserMapView(),));
              }, 
              icon: const Icon(Icons.west,color: Colors.white,)),
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                widget.text,
                style:const TextStyle(color: Colors.white,fontSize: 20),
              )),
          Center(
            child: Image.asset("assets/dataMedium.png"),
          ),
        ],
      ),
    );
  }
}