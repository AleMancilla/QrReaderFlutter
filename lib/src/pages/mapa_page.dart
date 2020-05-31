import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qreader/src/models/scan_models.dart';

class MapaPage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
  final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Coordenadas QR"),
      ),
      body: _crearFlutterMap(scan),
    );
  }

  Widget _crearFlutterMap(ScanModel map) {
    return FlutterMap(
      options: MapOptions(
        center: map.getLatlng(),
        zoom: 15
      ),
      layers: [
        _crearMap()
      ],
    );
  }

  _crearMap() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken':'pk.eyJ1IjoiYWxlbWFuY2lsbGEiLCJhIjoiY2thaHF1OXR4MDhtYzJxbzU2cjh4MmxmeCJ9.qK0fT7IkhuKadk-8VJ4Hqw',
        'id':'mapbox.satellite'
      }
    );
  }
}