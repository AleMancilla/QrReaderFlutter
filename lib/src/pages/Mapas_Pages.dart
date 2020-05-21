import 'package:flutter/material.dart';
import 'package:qreader/src/models/scan_models.dart';
import 'package:qreader/src/providers/dbProvider.dart';

class MapasPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: DBProvider.db.getTodosScans(),
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
                  onDismissed: (direction) => DBProvider.db.deleteScans(scans[i].id),
                  background: Container(color: Colors.redAccent,),
                  child: ListTile(
                    leading: Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor,),
                    title: Text(scans[i].valor),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey,),
                ),
              ),
            );
          }
        }
      ),
    );
  }
}