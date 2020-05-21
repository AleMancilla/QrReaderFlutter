import 'dart:async';
import 'package:qreader/src/models/scan_models.dart';
import 'package:qreader/src/providers/dbProvider.dart';

class ScansBloc{
  static final ScansBloc _singleScan = new ScansBloc._internal();

  factory ScansBloc(){
    return _singleScan;
  }

  ScansBloc._internal(){
    //obtener Scans de la base de datos
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();
  Stream<List<ScanModel>> get scansStream => _scansController.stream;

  dispose(){
    _scansController?.close();
  }

  obtenerScans() async {
    _scansController.sink.add( await DBProvider.db.getTodosScans());
  }

  agregarScan( ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  borrarScan(int id) async {
    await DBProvider.db.deleteScans(id);
    obtenerScans();
  }

  borrarTodosScans()async{
    await DBProvider.db.deleteAll();
    obtenerScans();
  }

}