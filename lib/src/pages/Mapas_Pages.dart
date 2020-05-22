import 'package:flutter/material.dart';
import 'package:qreader/src/bloc/ScansBloc.dart';
import 'package:qreader/src/models/scan_models.dart';
//import 'package:qreader/src/providers/dbProvider.dart';
import 'package:qreader/src/utils/utils.dart' as utils;

class MapasPage extends StatelessWidget {

  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<ScanModel>>(
        stream: scansBloc.scansStream,
        builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot){
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }

          final scans = snapshot.data;
          
          if(scans.length == 0){
            return Center(
              child: Text("No hay informacion"),
            );
          }else{
            return ListView.builder(
              itemCount: scans.length,
              itemBuilder: (BuildContext context, int i)=>Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) => scansBloc.borrarScan(scans[i].id),
                  background: Container(color: Colors.redAccent,),
                  child: ListTile(
                    leading: Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor,),
                    title: Text(scans[i].valor),
                    subtitle: Text(scans[i].id.toString()),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey,),
                    onTap: (){utils.abrirScan(scans[i]);},
                ),
              ),
            );
          }
        }
      ),
    );
  }
}