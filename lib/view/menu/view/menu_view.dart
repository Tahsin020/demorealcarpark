import 'package:demorealcarpark/product/widgets/card/custom_card.dart';
import 'package:flutter/material.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomCardWidget(widget: Column(children: [
                  Text('Hello World!',style: Theme.of(context).textTheme.headline6,)
                ],)),
              )
            ],
          ),
        ),
        
    );
  }
}
