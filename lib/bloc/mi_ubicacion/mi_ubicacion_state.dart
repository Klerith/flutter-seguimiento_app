part of 'mi_ubicacion_bloc.dart';

@immutable
class MiUbicacionState {

  final bool siguiendo;
  final bool existeUbicacion;
  final LatLng ubicacion;

  MiUbicacionState({
    this.siguiendo = true,
    this.existeUbicacion = false,
    this.ubicacion
  }); 

  MiUbicacionState copyWith({
    bool siguiendo,
    bool existeUbicacion,
    LatLng ubicacion,
  }) => new MiUbicacionState(
    siguiendo       : siguiendo ?? this.siguiendo,
    existeUbicacion : existeUbicacion ?? this.existeUbicacion,
    ubicacion       : ubicacion ?? this.ubicacion,
  );
  

}
