part of 'gps_bloc.dart';

//abstract
class GpsState extends Equatable {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  const GpsState(
      {required this.isGpsEnabled, required this.isGpsPermissionGranted});

  @override
  List<Object> get props => [isGpsEnabled, isGpsPermissionGranted];

  @override
  String toString() =>
      '{isgpsenabled: $isGpsEnabled, isgpspermissiongranted: $isGpsPermissionGranted}';
}

//class GpsInitial extends GpsState {}
