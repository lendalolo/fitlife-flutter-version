import 'package:fitness/features/clubs/pages/map/widget/place_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as lating;
import 'package:geolocator/geolocator.dart';

import '../../../../common/colo_extension.dart';
import 'model/location_model.dart';

class MapsScreen extends StatefulWidget {
  MapsScreen({super.key});

  static String get name => "MapPage";
  static String get path => "/MapPage";
  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late MapController mapController;
  LocationModel? currentLocation;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    getCurrentLocation();
  }

  // List<Widget> pages = [
  //   MapsScreen(),
  //   CategariesScreen(),
  //   FavoritePage(),
  //    LibraryPage()
  // ];
  void getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Location Service Disabled'),
          content: Text('Please enable location services.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Location Permission Denied'),
            content: Text('Please grant location permission.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
        );
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentLocation = LocationModel(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      mapController.move(
        lating.LatLng(currentLocation!.latitude, currentLocation!.longitude),
        15.0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(120),
      //   child: PlaceAppbar(text: 'Gyms'),
      // ),

      body:
          //  pages.elementAt(_currentIndex)
          Column(
            children: [
              Expanded(
                child: FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    initialCenter: lating.LatLng(
                      currentLocation?.latitude ?? 0.0,
                      currentLocation?.longitude ?? 0.0,
                    ),
                    initialZoom: 20,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                    ),
                    const MarkerLayer(
                      markers: [
                        Marker(
                          point: lating.LatLng(36.2115451, 37.1112709),
                          child: Icon(
                            Icons.pin_drop,
                            color: TColor.secondaryColor1,
                            size: 50,
                          ),
                        ),
                        Marker(
                          point: lating.LatLng(36.21035775, 37.154406340554),
                          child: Icon(
                            Icons.pin_drop,
                            color: TColor.secondaryColor1,
                            size: 50,
                          ),
                        ),
                        Marker(
                          point: lating.LatLng(36.1706322, 37.1240719),
                          child: Icon(
                            Icons.pin_drop,
                            color: TColor.secondaryColor1,
                            size: 50,
                          ),
                        ),
                        Marker(
                          point: lating.LatLng(36.1706322, 37.1240719),
                          child: Icon(
                            Icons.pin_drop,
                            color: TColor.secondaryColor1,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
