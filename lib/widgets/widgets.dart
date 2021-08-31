import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'package:mapa_app/helpers/helpers.dart';

import 'package:mapa_app/bloc/busqueda/busqueda_bloc.dart';
import 'package:mapa_app/bloc/mapa/mapa_bloc.dart';
import 'package:mapa_app/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';

// import 'package:polyline/polyline.dart' as Poly2;
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_polyline_algorithm/google_polyline_algorithm.dart' as Poly;
// import 'package:mapa_app/helpers/polyline.dart' as Poly;
import 'package:polyline_do/polyline_do.dart' as Poly;

import 'package:mapa_app/services/traffic_service.dart';

import 'package:mapa_app/models/search_result.dart';
import 'package:mapa_app/search/search_destination.dart';

part 'btn_mi_ruta.dart';
part 'btn_ubicacion.dart';
part 'btn_seguir_ubicacion.dart';
part 'marcador_manual.dart';
part 'searchbar.dart';