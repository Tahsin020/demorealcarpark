import 'package:demorealcarpark/product/widgets/card/custom_card.dart';
import 'package:demorealcarpark/view/map/model/area_model.dart';
import 'package:demorealcarpark/view/map/viewModel/area_service.dart';
import 'package:flutter/material.dart';

class MapItemDetails extends StatefulWidget {
  const MapItemDetails({Key? key, required this.areaModel}) : super(key: key);
  // Marker marker;
  final AreaModel areaModel;
  @override
  State<MapItemDetails> createState() => _MapItemDetailsState();
}

class _MapItemDetailsState extends State<MapItemDetails> {
  late IAreaService areaService;
  late AreaModel _areaModel;
  final String _full='Doldu';
  final String _null='Boşaldı';

  @override
  void didUpdateWidget(covariant MapItemDetails oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.areaModel != oldWidget.areaModel) {
      _updateWidget();
    }
  }

  @override
  void initState() {
    super.initState();
    areaService = AreaService();
    _areaModel = widget.areaModel;
  }

  void _updateWidget() {
    setState(() {
      _areaModel = widget.areaModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String _description = 'Açıklama : ${_areaModel.description}';
    final String _areaCount = 'Alan Sayısı : ${_areaModel.areaCount}';
    final String _emptyAreaCount = 'Boş Alan Sayısı : ${_areaModel.emptyAreaCount}';
    final String _filledAreaCount = 'Dolu Alan Sayısı : ${_areaModel.filledAreaCount}';
    final String _lang = 'Enlem Bilgisi : ${_areaModel.location?.lang}';
    final String _lung = 'Boylam Bilgisi : ${_areaModel.location?.lung}';
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomCardWidget(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            _TextWidget(text: _description),
            _TextWidget(text: _areaCount),
            _TextWidget(text: _emptyAreaCount),
            _TextWidget(text: _filledAreaCount),
            _TextWidget(text: _lang),
            _TextWidget(text: _lung),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    int filled = (_areaModel.filledAreaCount ?? 0) + 1;
                    int empty = (_areaModel.emptyAreaCount ?? 0) - 1;
                    //areaService.putItemToService(filled, empty, widget.areaModel.id ?? 0);
                    if (filled <= _areaModel.areaCount! &&
                        filled >= 0 &&
                        empty >= 0 &&
                        empty <= _areaModel.areaCount!) {
                      areaService.updateAreaValue(_areaModel.id ?? -1, filled, empty);
                    }
                    setState(() {});
                  },
                  child:  Text(_full),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      int filled = (_areaModel.filledAreaCount ?? 0) - 1;
                      int empty = (_areaModel.emptyAreaCount ?? 0) + 1;
                      if (filled <= _areaModel.areaCount! &&
                          filled >= 0 &&
                          empty >= 0 &&
                          empty <= _areaModel.areaCount!) {
                        areaService.updateAreaValue(_areaModel.id ?? -1, filled, empty);
                      }
                      setState(() {});
                    },
                    child: Text(_null)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget({
    Key? key,
    required String text,
  })  : _text = text,
        super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 14),
    );
  }
}
