import 'dart:async';

import 'package:car_coreconnect/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Location _locationController =new Location();

  final Completer<GoogleMapController> _mapController =
  Completer<GoogleMapController>();

  static const LatLng _pGooglePlex = LatLng(-17.42,32.22);
  static const LatLng _pApplePlex = LatLng(-17.65,32.78);
  LatLng? _currentP = null;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationUpdates().then((_) => {
      getPolylinePoints().then((coordinates) => {
        generatePolyLineFromPoints(coordinates),
      }),
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentP == null ? const Center(
        child: Text("Loading..."),)
          : GoogleMap(
            onMapCreated: ( (GoogleMapController controller) =>
                _mapController.complete(controller)),
          initialCameraPosition: CameraPosition(
              target: _pGooglePlex,
              zoom: 13,
          ),
        markers: {
          Marker(markerId: MarkerId("_currentLocation"),
              icon:BitmapDescriptor.defaultMarker,
              position: _currentP!),
            Marker(markerId: MarkerId("_sourceLocation"),
                icon:BitmapDescriptor.defaultMarker,
                position: _pGooglePlex),
            Marker(markerId: MarkerId("_destinationLocation"),
                icon:BitmapDescriptor.defaultMarker,
                position: _pApplePlex)
        },
        polylines: Set<Polyline>.of(polylines.values),
      ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async{
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos, zoom: 13,
    );
    await controller.animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async{
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled =await _locationController.serviceEnabled();
    if (_serviceEnabled){
      _serviceEnabled =await _locationController.requestService();
    }else{
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted){
        return;
      }
    }
    _locationController.onLocationChanged.listen((LocationData currentLocation){
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null){
        setState(() {
          _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentP!);
        });
      }

    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: GOOGLE_MAPS_API_KEY,
        request: PolylineRequest(
          origin: PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
          destination: PointLatLng(_pApplePlex.latitude, _pApplePlex.longitude),
          mode: TravelMode.driving,
    ));
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }else{
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }
  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async{
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }
}
