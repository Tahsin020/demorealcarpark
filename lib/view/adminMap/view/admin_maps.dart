import 'package:demorealcarpark/product/widgets/menu/menu.dart';
import 'package:demorealcarpark/product/widgets/notification/notification.dart';
import 'package:demorealcarpark/product/widgets/text/head_text_widget.dart';
import 'package:demorealcarpark/view/map/model/area_model.dart';
import 'package:demorealcarpark/view/map/view/google_maps_view.dart';
import 'package:demorealcarpark/view/map/viewModel/area_service.dart';
import 'package:demorealcarpark/view/mapItem/view/map_item_detail.dart';
import 'package:demorealcarpark/view/menu/view/menu_view.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AdminMapView extends StatefulWidget {
  const AdminMapView({ Key? key }) : super(key: key);

  @override
  State<AdminMapView> createState() => _AdminMapViewState();
}

class _AdminMapViewState extends State<AdminMapView> {
  final String title='Park Bölgeleri';
  late DatabaseReference _dbref;
  late final IAreaService areaService;
  List<AreaModel>? _areaItem;
  List<Marker> _markers = [];
  final _pageController = PageController();
  int _selectedIndex = 0;
  late BitmapDescriptor customRedMarker;
  late BitmapDescriptor customGreenMarker;

  @override
  void initState() { 
    super.initState();
      _dbref = FirebaseDatabase.instance.ref();
    areaService = AreaService();
    fetchPostItemsAdvance();
    getCustomMarker();
    listendb();
  }

  listendb() {
    _dbref.child("areas").onChildChanged.listen((event) {
      setState(() {
        _markers = [];
        fetchPostItemsAdvance();
      });
    });
  }

  Future<void> fetchPostItemsAdvance() async {
    getCustomMarker();
    _areaItem = await areaService.fetchParkingAreasItemsAdvance();
    for (var area in _areaItem!) {
      _markers.add(Marker(
          markerId: MarkerId(area.id.toString()),
          icon: customRedMarker,
          infoWindow: InfoWindow(
            title: area.description,
          ),
          position: LatLng(area.location!.lang!, area.location!.lung!),
          onTap: () {
            _selectedIndex = area.id!;
            setState(() {
              _pageController.animateToPage(area.id!,
                  duration: const Duration(milliseconds: 100), curve: Curves.elasticOut);
            });
          }));
    }
    setState(() {});
  }

  getCustomMarker() async {
    customRedMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/redcar.png');
    customGreenMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/greencar.png');
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          GoogleMapsView(markers: _markers),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              height: MediaQuery.of(context).size.height * 0.23,
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _areaItem?.length,
                itemBuilder: (context, index) {
                  final areaModel = _areaItem?[index];
                  return MapItemDetails(
                    areaModel: areaModel ?? AreaModel(),
                  );
                },
              )),
           MenuWidget(callback: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuView(),));
          },),
          const NotificationWidget(),
          HeadTextTitleWidget(title: title),
        ],
      )
    );
  }
}