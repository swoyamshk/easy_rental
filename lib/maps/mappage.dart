import 'dart:async';

import 'package:easy_rental_nepal/global/globalColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  late String lat;
  late String long;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.686382, 85.315399),
    zoom: 15,
  );

  bool showmap = false;
  LatLng? selectedLocation;
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    showmapfunc();
    _loadMapStyle();
  }

  showmapfunc() {
    Future.delayed(Duration(seconds: 1)).whenComplete(() {
      setState(() {
        showmap = true;
      });
    });
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permissions are permanently denied, we cannot request your current location.");
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),

          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: () {
              Navigator.pop(context, '/rent');
            },
          ),
        ),
        backgroundColor: GlobalColors.fontColor,
        title: Text('Select Location', style: TextStyle(color: Colors.white),),
      ),
      body: Stack(
        children: [
          showmap
              ? GoogleMap(
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (LatLng location) {
              setState(() {
                selectedLocation = location;
                print(selectedLocation);
              });
            },
            markers: Set<Marker>.from([
              if (selectedLocation != null)
                Marker(
                  markerId: MarkerId('selectedLocation'),
                  position: selectedLocation!,
                  infoWindow: InfoWindow(title: 'Selected Location'),
                ),
              if (currentLocation != null)
                Marker(
                  markerId: MarkerId('currentLocation'),
                  position: currentLocation!,
                  infoWindow: InfoWindow(title: 'Current Location'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                ),
            ]),
          )
              : Container(
            child: Center(child: CircularProgressIndicator()),
          ),
          if (selectedLocation != null)
            Positioned(
              bottom: 80.0,
              left: 115.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, selectedLocation);
                },
                child: Text("Choose Location"),
              ),
            ),
          Positioned(
            bottom: 30.0,
            left: 105.0,
            child: ElevatedButton(
              onPressed: () {
                _getCurrentLocation().then((value) {
                  setState(() {
                    currentLocation = LatLng(value.latitude, value.longitude);
                  });
                  Navigator.pop(context, currentLocation);
                });
              },
              child: Text("Get Current Location"),
            ),
          ),
        ],
      ),
    );
  }

  var mapthemedata;

  Future<void> _loadMapStyle() async {
    mapthemedata = await rootBundle.loadString('assets/raw/maptheme.json');
  }
}
