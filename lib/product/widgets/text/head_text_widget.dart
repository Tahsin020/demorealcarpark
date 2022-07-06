import 'package:flutter/material.dart';

class HeadTextTitleWidget extends StatefulWidget {
  const HeadTextTitleWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HeadTextTitleWidget> createState() => _HeadTextTitleWidgetState();
}

class _HeadTextTitleWidgetState extends State<HeadTextTitleWidget> {
  late String _title;
  @override
  void didUpdateWidget(covariant HeadTextTitleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.title != oldWidget.title) {
      _updateTitle();
    }
  }

  @override
  void initState() {
    super.initState();
    _title = widget.title;
  }

  void _updateTitle() {
    setState(() {
      _title = widget.title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.05,
      right: MediaQuery.of(context).size.width * 0.3,
      child: Text(
        _title,
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(color: Colors.black45, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
      ),
    );
  }
}
