import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key, required this.onCompleted, required this.title}) : super(key: key);

  final Future<void> Function() onCompleted;
  final String title;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _isLoading = false;
  late String _title;
  late Future<void> Function() _onCompleted;

  @override
  void didUpdateWidget(covariant LoginButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.title != oldWidget.title && widget.onCompleted != oldWidget.onCompleted) {
      _updateWidget();
    }
  }

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _onCompleted = widget.onCompleted;
  }

  void _changeLoading() {
    _isLoading = !_isLoading;
    setState(() {});
  }

  void _updateWidget() {
    setState(() {
      _onCompleted = widget.onCompleted;
      _title = widget.title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.teal),
        ),
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(_title),
        ),
        onPressed: () async {
          _changeLoading();
           _onCompleted();
          _changeLoading();
        },
      ),
    );
  }
}
