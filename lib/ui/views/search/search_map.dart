import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate/ui/index.dart';

import '../../../core/index.dart';

class SearchMap extends StatefulWidget {
  const SearchMap({super.key});

  @override
  State<SearchMap> createState() => _SearchMapState();
}

class _SearchMapState extends State<SearchMap> {
  /// Google Map Controller
  late final Completer<GoogleMapController> _controller;

  /// Markers
  Set<Marker>? markers;

  /// GoogleMap Dark Mode Style
  String? _darkMapStyle;

  @override
  void initState() {
    super.initState();

    _controller = Completer();

    markers = <Marker>{};

    _loadMapStyles();

    _getMarkers();
  }

  Future _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString(darkModeStyleJSONPath);
    setState(() {});
  }

  final CameraPosition _kGoogleCameraPosition = const CameraPosition(
    target: currentLatLng,
    zoom: kZoomValue,
  );

  Future<void> _getMarkers() async {
    final markerWidget = await _getCustomMarker(iconPath: building);

    markers!.addAll(latLngList
        .map((latLng) => Marker(
              markerId: MarkerId(latLngList.indexOf(latLng).toString()),
              position: latLng,
              icon: markerWidget,
              infoWindow: InfoWindow(
                title: latLngList.indexOf(latLng).toString(),
              ),
              onTap: () {
                //TODO: Not Implemented
              },
            ))
        .toList());

    setState(() {});
  }

  Future<BitmapDescriptor> _getCustomMarker({
    required String iconPath,
  }) async =>
      await SvgOnImage(
        iconPath: iconPath,
      ).toBitmapDescriptor(
        logicalSize: const Size(kMapMarkerSize, kMapMarkerSize),
        imageSize: const Size(kMapMarkerSize, kMapMarkerSize),
      );

  @override
  Widget build(BuildContext context) {
    return _darkMapStyle == null
        ? SizedBox(
            height: MediaQuery.of(context).size.height,
          )
        : GoogleMap(
            onTap: (latLng) {
              //TODO: Not Implemented
            },
            markers: markers!,
            initialCameraPosition: _kGoogleCameraPosition,
            mapType: MapType.normal,
            style: _darkMapStyle,
            myLocationEnabled: true,
            compassEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          );
  }
}
