import 'package:flutter/material.dart';
import 'package:mapa_app/pages/acceso_gps_page.dart';

import 'package:mapa_app/pages/loading_page.dart';
import 'package:mapa_app/pages/mapa_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: LoadingPage(),
      routes: {
        'mapa'      : ( _ ) => MapaPage(),
        'loading'   : ( _ ) => LoadingPage(),
        'acceso_gps': ( _ ) => AccesoGpsPage(),
      },
    );
  }
}