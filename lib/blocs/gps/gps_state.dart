part of 'gps_bloc.dart';

//abstract
class GpsState extends Equatable {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  bool get isAllGranted => isGpsEnabled && isGpsPermissionGranted;

  const GpsState(
      {required this.isGpsEnabled, required this.isGpsPermissionGranted});

  GpsState copyWith(
          {bool? isGpsEnabled, bool? isGpsPermissionGranted}) =>
      GpsState(
          isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
          isGpsPermissionGranted:
              isGpsPermissionGranted ?? this.isGpsPermissionGranted);

  @override
  List<Object> get props => [isGpsEnabled, isGpsPermissionGranted];

  @override
  String toString() =>
      '{isgpsenabled: $isGpsEnabled, isgpspermissiongranted: $isGpsPermissionGranted}';
}

//class GpsInitial extends GpsState {}
