import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qreader/src/models/scan_models.dart';

class MapaPage extends StatelessWidget {

  final mapa = MapController();
  @override
  Widget build(BuildContext context) {
  
  final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Coordenadas QR"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.location_searching), onPressed: (){mapa.move(scan.getLatlng(), 15.0);})
        ],
      ),
      body: _crearFlutterMap(scan),
      floatingActionButton: _crearBotonFlotante(context),
    );
  }

  Widget _crearFlutterMap(ScanModel map) {
    return FlutterMap(
      mapController: mapa,
      options: MapOptions(
        center: map.getLatlng(),
        zoom: 15
      ),
      layers: [
        _crearMap(),
        _crearMarcador(map)
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

  _crearMarcador(ScanModel scan) {
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          point: scan.getLatlng(),
          width: 120.0,
          height: 120.0,
          builder: (BuildContext context) => Container(
            child: Icon(Icons.location_on,size: 70.0,),
          )
        )
      ]
    );
  }

  _crearBotonFlotante(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: (){}
    );
  }
}