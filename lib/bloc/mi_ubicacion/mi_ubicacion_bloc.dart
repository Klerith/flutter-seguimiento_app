import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'mi_ubicacion_event.dart';
part 'mi_ubicacion_state.dart';

class MiUbicacionBloc extends Bloc<MiUbicacionEvent, MiUbicacionState> {
  
  MiUbicacionBloc() : super(MiUbicacionState());

  // Geolocator
  final _geolocator = new Geolocator();
  StreamSubscription<Position> _positionSubscription;


  void iniciarSeguimiento() {

    final locationOptions = LocationOptions(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10
    );

    _positionSubscription = this._geolocator.getPositionStream(locationOptions).listen(( Position position ) {
      final nuevaUbicacion = new LatLng(position.latitude, position.longitude);
      add( OnUbicacionCambio( nuevaUbicacion ) );
    });

  }

  void cancelarSeguimiento() {
    _positionSubscription?.cancel();
  }


  @override
  Stream<MiUbicacionState> mapEventToState( MiUbicacionEvent event ) async* {
    
    if ( event is OnUbicacionCambio ) {
      yield state.copyWith(
        existeUbicacion: true,
        ubicacion: event.ubicacion
      );
    }

  }
}
