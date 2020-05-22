
import 'package:qreader/src/models/scan_models.dart';
import 'package:url_launcher/url_launcher.dart';

abrirScan(ScanModel scan) async {

  if(scan.tipo == 'http'){
    if (await canLaunch(scan.valor)) {
      await launch(scan.valor);
    } else {
      throw 'Could not launch ${scan.valor}';
    }
  }else{
    print('GEO.......................................');
  }
}