import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../themes/themes.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  GoogleMapController? _googleMapController;

  MapBloc() : super(const MapState()) {
    on<OnMapInitialzedEvent>(_onInitMap);
  }

  void _onInitMap(OnMapInitialzedEvent event, Emitter<MapState> emit) {
    _googleMapController = event.controller;
    _googleMapController!.setMapStyle(jsonEncode(grayMapTheme));
    emit(state.copyWith(isMapInitialized: true));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _googleMapController?.animateCamera(cameraUpdate);
  }
}
