import 'package:flutter/material.dart';
import 'package:qreader/src/pages/Direcciones_Page.dart';
import 'package:qreader/src/pages/Mapas_Pages.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QrReader",style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            padding: EdgeInsets.all(10.0),
            icon: Icon(Icons.delete_forever)
          )

        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigatorBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
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
}