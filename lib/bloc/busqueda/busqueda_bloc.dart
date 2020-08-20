import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mapa_app/models/search_result.dart';
import 'package:meta/meta.dart';

part 'busqueda_event.dart';
part 'busqueda_state.dart';

class BusquedaBloc extends Bloc<BusquedaEvent, BusquedaState> {
  BusquedaBloc() : super( BusquedaState() );

  @override
  Stream<BusquedaState> mapEventToState( BusquedaEvent event ) async* {
    
    if ( event is OnActivarMarcadorManual ) {
      yield state.copyWith( seleccionManual: true );

    } else if ( event is OnDesactivarMarcadorManual ) {
      yield state.copyWith( seleccionManual: false );

    } else if ( event is OnAgregarHistorial ) {

      final existe = state.historial.where(
        (result) => result.nombreDestino == event.result.nombreDestino
      ).length;

      if ( existe == 0 ) {
        final newHistorial = [...state.historial, event.result];
        yield state.copyWith( historial: newHistorial );
      }
      
    }

    


  }
}
