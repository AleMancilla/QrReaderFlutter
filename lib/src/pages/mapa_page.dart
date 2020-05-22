import 'package:flutter/material.dart';
import 'package:qreader/src/models/scan_models.dart';

class MapaPage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
  final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Coordenadas QR"),
      ),
      body: Center(
        child: Text(scan.valor),
      ),
    );
  }
}