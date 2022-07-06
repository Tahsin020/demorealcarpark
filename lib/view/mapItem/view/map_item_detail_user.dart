import 'package:demorealcarpark/product/widgets/card/custom_card.dart';
import 'package:demorealcarpark/view/map/model/area_model.dart';
import 'package:flutter/material.dart';

class MapItemDetailsUser extends StatefulWidget {
  const MapItemDetailsUser({Key? key, required this.areaModel}) : super(key: key);
  final AreaModel areaModel;
  @override
  State<MapItemDetailsUser> createState() => _MapItemDetailsUserState();
}

class _MapItemDetailsUserState extends State<MapItemDetailsUser> {
  late AreaModel _areaModel;

  @override
  void didUpdateWidget(covariant MapItemDetailsUser oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.areaModel != oldWidget.areaModel) {
      _updateWidget();
    }
  }

  @override
  void initState() {
    super.initState();
    _areaModel = widget.areaModel;
  }

  void _updateWidget() {
    setState(() {
      _areaModel = widget.areaModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    String _description = 'Açıklama : ${_areaModel.description}';
    String _areaCount = 'Alan Sayısı : ${_areaModel.areaCount}';
    String _emptyAreaCount = 'Boş Alan Sayısı : ${_areaModel.emptyAreaCount}';
    String _filledAreaCount = 'Dolu Alan Sayısı : ${_areaModel.filledAreaCount}';

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomCardWidget(
          widget: Column(
        children: [
          _TextWidget(text: _description),
          _TextWidget(text: _areaCount),
          _TextWidget(text: _emptyAreaCount),
          _TextWidget(text: _filledAreaCount),
        ],
      )),
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
      style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
    );
  }
}
