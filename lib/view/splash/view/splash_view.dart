import 'dart:async';
import 'package:demorealcarpark/product/constants/color.dart';
import 'package:demorealcarpark/view/userMap/view/user_map_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({ Key? key }) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final String _imagePath='assets/dataMedium.png';
  @override
  void initState() {
    super.initState();
     Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const UserMapView()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [dataColors,dataTurquosieColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: Center(
          child: Image.asset(_imagePath),
        ),
      ),
    );
  }
}