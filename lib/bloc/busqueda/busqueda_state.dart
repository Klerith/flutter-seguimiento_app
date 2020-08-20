part of 'busqueda_bloc.dart';

@immutable
class BusquedaState {

  final bool seleccionManual;

  BusquedaState({
    this.seleccionManual = false
  });

  BusquedaState copyWith({
    bool seleccionManual
  }) => BusquedaState(
    seleccionManual: seleccionManual ?? this.seleccionManual
  );

}