import 'package:flutter/material.dart';

class AboutUsView extends StatefulWidget {
  AboutUsView({Key? key}) : super(key: key);

  @override
  _AboutUsViewState createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text('About Screen',style: Theme.of(context).textTheme.headline6,),
      ),
    );
  }
}