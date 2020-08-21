part of 'mapa_bloc.dart';

@immutable
class MapaState {
  
  final bool mapaListo;
  final bool dibujarRecorrido;
  final bool seguirUbicacion;

  final LatLng ubicacionCentral;

  // Polylines
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;

  MapaState({
    this.mapaListo = false,
    this.dibujarRecorrido = false,
    this.seguirUbicacion = false,
    this.ubicacionCentral,
    Map<String, Polyline> polylines,
    Map<String, Marker> markers
  }): this.polylines = polylines ?? new Map(),
      this.markers = markers ?? new Map();


  MapaState copyWith({
    bool mapaListo,
    bool dibujarRecorrido,
    bool seguirUbicacion,
    LatLng ubicacionCentral,
    Map<String, Polyline> polylines,
    Map<String, Marker> markers
  }) => MapaState(
    mapaListo: mapaListo ?? this.mapaListo,
    polylines: polylines ?? this.polylines,
    markers  : markers ?? this.markers,
    ubicacionCentral : ubicacionCentral ?? this.ubicacionCentral,
    seguirUbicacion  : seguirUbicacion ?? this.seguirUbicacion,
    dibujarRecorrido : dibujarRecorrido ?? this.dibujarRecorrido,
  );

}
