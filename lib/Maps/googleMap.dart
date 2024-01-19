import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWithImageGoogle extends StatefulWidget {
  @override
  _MapWithImageGoogleState createState() => _MapWithImageGoogleState();
}

class _MapWithImageGoogleState extends State<MapWithImageGoogle> {
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor? _imageBitmap;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final ByteData data = await rootBundle.load('assets/MapaPrueba.png');
    final Uint8List bytes = data.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ByteData? byteData = await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();
    final imageBitmap = await BitmapDescriptor.fromBytes(pngBytes);

    setState(() {
      _imageBitmap = imageBitmap;
    });
  }
  Set<Polygon> polygons = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Techmall'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        polygons: polygons,
        initialCameraPosition: CameraPosition(
          
          target: LatLng(-1.9185198779001804, -79.56336505601043), // Cambia las coordenadas según tu ubicación
          zoom: 14.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _onMapCreated;
        },
        markers: {
          /* Marker(
            markerId: MarkerId("your_marker_id"),
            position: LatLng(-1.9185198779001804, -79.56336505601043), // Cambia las coordenadas según tu ubicación
            icon: _imageBitmap?? BitmapDescriptor.defaultMarker, 
          ), */
        },
      ),
    );
  }
  void _onMapCreated(GoogleMapController controller) {

    // Add a polygon to the map
    setState(() {
      polygons.add(
        Polygon(
          polygonId: PolygonId('example_polygon'),
          points: [
            LatLng(-1.9184108779001900, -79.56336505601043),
            LatLng(-1.9186288779001803, -79.56336505601043),
            LatLng(-1.9185198779001900, -79.56325934469917),
            LatLng(-1.9185198779001900, -79.5634707673217),
          ],
          strokeWidth: 2,
          strokeColor: Colors.redAccent,
          fillColor: Colors.red,
        ),
      );
    });
  
}

}