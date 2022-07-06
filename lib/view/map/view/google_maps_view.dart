import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({Key? key, required this.markers}) : super(key: key);
  final List<Marker> markers;
  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  final Completer<GoogleMapController> _controller = Completer();
  late List<Marker> _markers;

  @override
  void didUpdateWidget(covariant GoogleMapsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.markers != oldWidget.markers) {
      _updateWidget();
    }
  }

  @override
  void initState() {
    super.initState();
    _markers = widget.markers;
  }

  void _updateWidget() {
    setState(() {
      _markers = widget.markers;
    });
  }

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(36.577242, 36.152812),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: true,
      rotateGesturesEnabled: true,
      compassEnabled: true,
      scrollGesturesEnabled: true,
      zoomGesturesEnabled: true,
      mapType: MapType.normal,
      markers: Set<Marker>.of(_markers),
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
