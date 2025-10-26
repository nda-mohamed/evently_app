import 'package:evently_app/Ui/screens/home/tabs/map_tab/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapTab extends StatefulWidget {
  const MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  String? _mapStyle;
  late GoogleMapController _controller;
  Location location = Location();
  LatLng? initLocation;

  @override
  Future<void> _loadMapStyle() async {
    final String mapStyle = await rootBundle.loadString(
      'assets/map_style/map_style.json',
    );
    setState(() {
      _mapStyle = mapStyle;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
    initMap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          initLocation == null
              ? Center(child: CircularProgressIndicator())
              : GoogleMap(
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: initLocation ?? LatLng(0, 0),
                    zoom: 10,
                  ),
                  //mapType: MapType.hybrid,
                  onMapCreated: (controller) {
                    _controller = controller;
                  },
                  style: _mapStyle,
                  polylines: {
                    Polyline(
                      polylineId: const PolylineId('1'),
                      color: Colors.blue,
                      width: 5,
                      points: [
                        LatLng(30.0444, 31.2357),
                        LatLng(30.3500, 30.9000),
                        LatLng(30.6500, 30.4000),
                        LatLng(30.9000, 30.1000),
                        LatLng(31.0500, 30.0000),
                        LatLng(31.1500, 29.9500),
                        LatLng(31.2001, 29.9187),
                      ],
                    ),
                  },
                  markers: Eventt.egyptEvents
                      .map(
                        (event) => Marker(
                          onTap: () {
                            _updateCameraPosition(
                              LatLng(event.latitude, event.longitude),
                            );
                          },
                          infoWindow: InfoWindow(title: event.title),
                          markerId: MarkerId(event.id),
                          position: LatLng(event.latitude, event.longitude),
                        ),
                      )
                      .toSet(),
                ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 42),
            child: Column(
              children: [
                Spacer(),
                SizedBox(
                  height: 94,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Image.network(
                        Eventt.egyptEvents[index].imageUrl ?? '',
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: Eventt.egyptEvents.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _updateCameraPosition(LatLng latLng) async {
    await _controller.animateCamera(
      duration: Duration(milliseconds: 500),
      CameraUpdate.newCameraPosition(CameraPosition(target: latLng, zoom: 20)),
    );
  }

  Future<void> initMap() async {
    // step 1 -> check id location services are enabled
    bool servicesEnabled = await location.serviceEnabled();
    if (!servicesEnabled) {
      servicesEnabled = await location.requestService();
      if (!servicesEnabled) {
        return;
      }
    }

    // step 2 -> check permission status
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied ||
        permissionStatus == PermissionStatus.deniedForever) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    // step 3 -> get location (user)
    var locationData = await location.getLocation();
    setState(() {
      initLocation = LatLng(locationData.latitude!, locationData.longitude!);
    });
  }
}
