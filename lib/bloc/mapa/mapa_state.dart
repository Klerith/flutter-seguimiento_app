part of 'mapa_bloc.dart';

@immutable
class MapaState {
  
  final bool mapaListo;
  final bool dibujarRecorrido;
  final bool seguirUbicacion;

  final LatLng? ubicacionCentral;

  // Polylines
  final Map<String, Polyline>? polylines;

  MapaState({
    this.mapaListo = false,
    this.dibujarRecorrido = false,
    this.seguirUbicacion = false,
    this.ubicacionCentral,
    Map<String, Polyline>? polylines
  }): this.polylines = polylines ?? new Map();


  MapaState copyWith({
    bool? mapaListo,
    bool? dibujarRecorrido,
    bool? seguirUbicacion,
    LatLng? ubicacionCentral,
    Map<String, Polyline>? polylines
  }) => MapaState(
    mapaListo: mapaListo ?? this.mapaListo,
    polylines: polylines ?? this.polylines,
    ubicacionCentral : ubicacionCentral ?? this.ubicacionCentral,
    seguirUbicacion  : seguirUbicacion ?? this.seguirUbicacion,
    dibujarRecorrido : dibujarRecorrido ?? this.dibujarRecorrido,
  );

}
