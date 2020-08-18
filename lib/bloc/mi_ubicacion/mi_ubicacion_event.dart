part of 'mi_ubicacion_bloc.dart';

@immutable
abstract class MiUbicacionEvent {}

class OnUbicacionCambio extends MiUbicacionEvent {

  final LatLng ubicacion;
  OnUbicacionCambio(this.ubicacion);

}
