import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription? positionStream;

  LocationBloc() : super(const LocationState()) {
    on<LocationEvent>((event, emit) {});
  }

  Future getcurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    print('Position: $position');
    //TODO retornar objeto LatLng
  }

  void startFollowingUser() {
    print('startFollowingUser');
    positionStream = Geolocator.getPositionStream().listen((event) {
      print('position: $event');
    });
  }

  void stopFollowingUser() {
    positionStream?.cancel();
    print('stopFollowingUser');
  }

  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }
}
