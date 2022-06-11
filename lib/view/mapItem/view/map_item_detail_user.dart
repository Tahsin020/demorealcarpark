import 'package:demorealcarpark/product/constants/color.dart';
import 'package:demorealcarpark/product/widgets/card/custom_card.dart';
import 'package:demorealcarpark/view/map/model/area_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapItemDetailsUser extends StatefulWidget {
  MapItemDetailsUser({Key? key, required this.areaModel}) : super(key: key);
  AreaModel areaModel;
  @override
  State<MapItemDetailsUser> createState() => _MapItemDetailsUserState();
}

class _MapItemDetailsUserState extends State<MapItemDetailsUser> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomCardWidget(
          widget: Column(
        children: [
          Text(
            'Açıklama : ${widget.areaModel.description}',
            style:
                Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
          ),
          Text(
            'Alan Sayısı : ${widget.areaModel.areaCount}',
            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
          ),
          Text(
            'Boş Alan Sayısı : ${widget.areaModel.emptyAreaCount}',
            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
          ),
          Text(
            'Dolu Alan Sayısı : ${widget.areaModel.filledAreaCount}',
            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
          ),
        ],
      )),
    );
  }
}
