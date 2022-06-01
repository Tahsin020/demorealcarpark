import 'dart:async';

import 'package:demorealcarpark/view/map/model/parking_areas_model.dart';
import 'package:demorealcarpark/view/map/modelView/parking_areas_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({ Key? key }) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late DatabaseReference _dbref;
  late final IParkingAreasService areasService;
  bool _isLoading = false;
  List<ParkingAreasModel>? _areasItem;
  List<Marker> _markers = [];
  String statusTrue="Dolu Park Alanı";
  String statusFalse ="Boş Park Alanı";

  late BitmapDescriptor customRedMarker;
  late BitmapDescriptor customGreenMarker;
  
  @override
  void initState() {
    super.initState();
    _dbref=FirebaseDatabase.instance.ref();
    areasService = ParkingAreasService();
    fetchPostItemsAdvance();
    getCustomMarker();
    listendb();
  }

  listendb(){
    _dbref.child("parkingAreas").onChildChanged.listen((event) {
      setState(() {
        _markers=[];
        fetchPostItemsAdvance();
      });
    });    
  }

   void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    getCustomMarker();
    _areasItem = await areasService.fetchParkingAreasItemsAdvance();
    for (var area in _areasItem!) {
      _markers.add(
        Marker(
          markerId: MarkerId(area.id.toString()),
          icon: area.status! ? customRedMarker : customGreenMarker,
          infoWindow: InfoWindow(
            title: area.status! ? statusTrue : statusFalse,
          ),
          position: LatLng(area.location!.lang!,area.location!.lung!),
          ));
    }
    _changeLoading();
  }
  
  getCustomMarker() async {
    customRedMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/redcar.png');
    customGreenMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/greencar.png');
  }
 
  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(36.577242, 36.152812),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading ? const CircularProgressIndicator() :
           IconButton(onPressed: (){}, icon: const Icon(Icons.edit_notifications_outlined),color: Colors.white,)
        ],
      ),
      body: GoogleMap(
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
            },),          
    );
  }
}


