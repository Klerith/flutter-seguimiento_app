import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:mapa_app/helpers/helpers.dart';

import 'package:mapa_app/pages/acceso_gps_page.dart';
import 'package:mapa_app/pages/mapa_page.dart';


class LoadingPage extends StatefulWidget {

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    
    if (  state == AppLifecycleState.resumed ) {
      if ( await Geolocator().isLocationServiceEnabled()  ) {
        Navigator.pushReplacement(context, navegarMapaFadeIn(context, MapaPage() ));
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.checkGpsYLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          
          print(snapshot.data);
          if ( snapshot.hasData ) {
            return Center(child: Text( snapshot.data ) );
          } else {
            return Center(child: CircularProgressIndicator(strokeWidth: 2 ) );
          }
          
        },
      ),
   );
  }

  Future checkGpsYLocation( BuildContext context ) async {

    // PermisoGPS
    final permisoGPS = await Permission.location.isGranted;
    // GPS está activo
    final gpsActivo  = await Geolocator().isLocationServiceEnabled();

    if ( permisoGPS && gpsActivo ) {
      Navigator.pushReplacement(context, navegarMapaFadeIn(context, MapaPage() ));
      return '';
    } else if ( !permisoGPS ) {
      Navigator.pushReplacement(context, navegarMapaFadeIn(context, AccesoGpsPage() ));  
      return 'Es necesario el permiso de GPS';
    } else {
      return 'Active el GPS';
    }

  }
}