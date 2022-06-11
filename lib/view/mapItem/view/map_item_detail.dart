import 'package:demorealcarpark/product/widgets/card/custom_card.dart';
import 'package:demorealcarpark/view/map/model/area_model.dart';
import 'package:demorealcarpark/view/map/viewModel/area_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MapItemDetails extends StatefulWidget {
  MapItemDetails({Key? key, required this.areaModel}) : super(key: key);
  // Marker marker;
  AreaModel areaModel;
  @override
  State<MapItemDetails> createState() => _MapItemDetailsState();
}

class _MapItemDetailsState extends State<MapItemDetails> {
  late DatabaseReference _dbref;
  late IAreaService areaService;

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
    areaService=AreaService();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomCardWidget(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text('Aciklama : ${widget.areaModel.description}'),
            Text('Alan Sayısı : ${widget.areaModel.areaCount}'),
            Text('Boş Alan Sayısı : ${widget.areaModel.emptyAreaCount}'),
            Text('Dolu Alan Sayısı : ${widget.areaModel.filledAreaCount}'),
            Text('Enlem Bilgisi : ${widget.areaModel.location?.lang}'),
            Text('Boylam Bilgisi : ${widget.areaModel.location?.lung}'),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    int filled = (widget.areaModel.filledAreaCount ?? 0) + 1;
                    int empty = (widget.areaModel.emptyAreaCount ?? 0) - 1;
                    areaService.putItemToService(filled, empty, widget.areaModel.id ?? 0);
                    _updateAreaValue(widget.areaModel.id ?? 0, filled, empty);
                    setState(() {});
                  },
                  child: const Text('Doldu'),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      int filled = (widget.areaModel.filledAreaCount ?? 0) - 1;
                      int empty = (widget.areaModel.emptyAreaCount ?? 0) + 1;
                      _updateAreaValue(widget.areaModel.id ?? 0, filled, empty);
                       setState(() {});
                    },
                    child: const Text('Boşaldı')),
              ],
            )
          ],
        ),
      ),
    );
  }

  _updateAreaValue(int id, int filledAreaCount, int emptyAreaCount) {
    _dbref
        .child("areas")
        .child(id.toString())
        .update({"filledAreaCount": filledAreaCount, "emptyAreaCount": emptyAreaCount});
  }
}
