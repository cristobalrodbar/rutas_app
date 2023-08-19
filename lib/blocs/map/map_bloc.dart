import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../themes/themes.dart';
import '../../blocs/blocs.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationBloc locationBloc;
  GoogleMapController? _googleMapController;

  MapBloc({
    required this.locationBloc,
  }) : super(const MapState()) {
    on<OnMapInitialzedEvent>(_onInitMap);
    on<OnStartFollowingUserEvent>(_onStartFollowingUser);
    on<OnStopFollowingUserEvent>(
        (event, emit) => emit(state.copyWith(isFollowingUser: false)));

    locationBloc.stream.listen((locationState) {
      if (!state.isFollowingUser || locationState.lastKnownLocation == null) {
        return;
      }
      //if (!state.followUser) return;
      //if (locationState.lastKnownLocation == null) return;

      moveCamera(locationState.lastKnownLocation!);
    });
  }

  void _onInitMap(OnMapInitialzedEvent event, Emitter<MapState> emit) {
    _googleMapController = event.controller;
    _googleMapController!.setMapStyle(jsonEncode(grayMapTheme));
    emit(state.copyWith(isMapInitialized: true));
  }

  void _onStartFollowingUser(
      OnStartFollowingUserEvent event, Emitter<MapState> emit) {
    (event, emit) => emit(state.copyWith(isFollowingUser: true));
    if (locationBloc.state.lastKnownLocation == null) {
      return;
    }
    moveCamera(locationBloc.state.lastKnownLocation!);
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _googleMapController?.animateCamera(cameraUpdate);
  }
}
