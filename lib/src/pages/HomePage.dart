import 'package:flutter/material.dart';
import 'package:qreader/src/bloc/ScansBloc.dart';
import 'package:qreader/src/models/scan_models.dart';
//import 'package:qreader/src/providers/dbProvider.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:qreader/src/pages/Direcciones_Page.dart';
import 'package:qreader/src/pages/Mapas_Pages.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scanBloc = new ScansBloc();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QrReader",style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              scanBloc.borrarTodosScans();
            },
            padding: EdgeInsets.all(10.0),
            icon: Icon(Icons.delete_forever)
          )

        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigatorBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _scanQR,
        child: Icon(Icons.zoom_out_map),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _crearBottomNavigatorBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text("Mapa")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions),
          title: Text("Direccion")
        ),
      ]
    );
  }

  Widget _callPage(int paginaActual){
    switch(paginaActual){
      case 0: return MapasPage();
      case 1: return DireccionesPage();
      default: return MapasPage();
    } 
  }

  _scanQR() async{
    //geo:40.70757880037786,-73.94276991328128
    String futureString = "http://www.google.com";
    
    //  String futureString ='' ;
    //  try {
    //    futureString = await scanner.scan();
    //  } catch (e) {
    //    futureString = e.toString();
    //  }

    if (futureString != null){
      final scan = ScanModel(valor: futureString);
      //DBProvider.db.nuevoScan(scan);
      scanBloc.agregarScan(scan);
    }



    print("valor de future es ############################################## $futureString");
    
  }
}