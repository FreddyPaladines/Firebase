import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class FlutterMapDocs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<LatLng> guayaquilPolygon = [
LatLng(-1.9185198779001804, -79.56336505601043),
LatLng(-1.9185198779001804, -79.58836505601043),
LatLng(-1.9435198779001804, -79.58836505601043),
LatLng(-1.9435198779001804, -79.56336505601043),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guayaquil Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(-1.9185198779001804, -79.56336505601043),
          initialZoom: 14.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://api.maptiler.com/maps/hybrid/{z}/{x}/{y}.jpg?key=56DEI3YkQSrjkaW9VSIU',
            subdomains: ['a', 'b', 'c'],
          ),
          PolygonLayer(
            polygons: [
              Polygon(
                isFilled: true,
                points: guayaquilPolygon,
                color: Colors.red.withOpacity(0.2),
                borderColor: Colors.red,
                borderStrokeWidth: 2,
              ),
            ],
          ),
          OverlayImageLayer(
  overlayImages: [
    OverlayImage(
      bounds: LatLngBounds(
        LatLng(-1.9185198779001804, -79.56336505601043),
        LatLng(-1.9435198779001804, -79.58836505601043),
      ),
      //imageProvider: NetworkImage('https://picsum.photos/250?image=9'),
      imageProvider: AssetImage('assets/GNDVI_local.tif')
    ),
  ],
),
        ],
      ),
    );
  }
}