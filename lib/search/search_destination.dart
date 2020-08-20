import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:mapa_app/models/search_response.dart';

import 'package:mapa_app/models/search_result.dart';
import 'package:mapa_app/services/traffic_service.dart';

class SearchDestination extends SearchDelegate<SearchResult> {

  @override
  final String searchFieldLabel;
  final TrafficService _trafficService;
  final LatLng proximidad;

  SearchDestination( this.proximidad )
    : this.searchFieldLabel = 'Buscar...',
      this._trafficService = new TrafficService();


  @override
  List<Widget> buildActions(BuildContext context) {

    return [
      IconButton(
        icon: Icon( Icons.clear ), 
        onPressed: () => this.query = ''
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon( Icons.arrow_back_ios ), 
      onPressed: () => this.close(context, SearchResult(cancelo: true) )
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    return this._contruirResultadosSugerencias();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if ( this.query.length == 0 ) {
      return ListView(
        children: [

          ListTile(
            leading: Icon( Icons.location_on ),
            title: Text('Colocar ubicación manualmente'),
            onTap: () {
              this.close(context, SearchResult( cancelo: false, manual: true ) ); 
            },
          )
        ],
      );

    }

    return this._contruirResultadosSugerencias();

  }


  Widget _contruirResultadosSugerencias() {

    if ( this.query == 0 ) {
      return Container();
    }

    return FutureBuilder(
      future: this._trafficService.getResultadosPorQuery( this.query.trim(), proximidad ),
      builder: (BuildContext context, AsyncSnapshot<SearchResponse> snapshot) {

        if ( !snapshot.hasData ) {
          return Center(child: CircularProgressIndicator());
        }

        final lugares = snapshot.data.features;

        if ( lugares.length == 0 ) {
          return ListTile(
            title: Text('No hay resultados con $query'),
          );
        }

        
        return ListView.separated(
          itemCount: lugares.length,
          separatorBuilder: ( _ , i ) => Divider(), 
          itemBuilder: ( _, i ) {
            
            final lugar = lugares[i];

            return ListTile(
              leading: Icon( Icons.place ),
              title: Text( lugar.textEs ),
              subtitle: Text( lugar.placeNameEs ),
              onTap: () {
                print( lugar );
              },
            );
          }, 
        );

      }
    );

  }

}