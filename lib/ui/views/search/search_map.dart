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

  /// Current Location
  static const currentLatLng = LatLng(28.6139, 77.2088);

  /// GoogleMap Dark Mode Style
  String? _darkMapStyle;

  /// List of Lat Lng
  List<LatLng> latLngList = <LatLng>[];

  /// List of Marker Item
  List<MarkerItem> markerItems = <MarkerItem>[];

  @override
  void initState() {
    super.initState();

    _controller = Completer();

    markers = <Marker>{};

    _loadMapStyles();

    latLngList = const [
      LatLng(28.610622053913218, 77.2058529406786),
      LatLng(28.607457295113054, 77.21310563385487),
      LatLng(28.611488578385913, 77.21241898834705),
      LatLng(28.617265323620472, 77.21198983490467),
      LatLng(28.619676351908574, 77.20696873962879),
      LatLng(28.621070202383816, 77.20593877136707),
    ];

    markerItems = [
      MarkerItem(title: kMarkerTitle1, iconPath: building),
      MarkerItem(title: kMarkerTitle2, iconPath: building),
      MarkerItem(title: kMarkerTitle3, iconPath: building),
      MarkerItem(title: kMarkerTitle4, iconPath: building),
      MarkerItem(title: kMarkerTitle5, iconPath: building),
      MarkerItem(title: kMarkerTitle6, iconPath: building),
    ];

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
    final markerWidgets = <BitmapDescriptor>[];
    for (final item in markerItems) {
      final widget = await _getCustomMarker(
        title: item.title,
        iconPath: item.iconPath,
      );
      markerWidgets.add(widget);
    }

    markers!.addAll(latLngList
        .map((latLng) => Marker(
              markerId: MarkerId(latLngList.indexOf(latLng).toString()),
              position: latLng,
              icon: markerWidgets[0],
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
    required String title,
    required String iconPath,
  }) async =>
      await SvgOnImage(
        title: title,
        iconPath: iconPath,
      ).toBitmapDescriptor(
        logicalSize: const Size(
          kMapMarkerSize,
          kMapMarkerSize,
        ),
        imageSize: const Size(
          kMapMarkerSize,
          kMapMarkerSize,
        ),
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
