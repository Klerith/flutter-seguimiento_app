part of 'widgets.dart';

class BtnSeguirUbicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MapaBloc, MapaState>(
      builder: (context, state) => this._crearBoton(context, state)
    );
  }

  Widget _crearBoton(BuildContext context, MapaState state ) {

    final mapaBloc = context.bloc<MapaBloc>();

    return Container(
      margin: EdgeInsets.only(bottom: 10 ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: Icon( 
            state.seguirUbicacion
              ? Icons.directions_run
              : Icons.accessibility_new,
            color: Colors.black87 
          ),
          onPressed: () {
            
            mapaBloc.add( OnSeguirUbicacion() );

          },
        ),
      ),
    );
  }
}




