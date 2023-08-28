part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingUser;
  final bool showMyRoute;

  //polylines
  final Map<String, Polyline> polylines;

  const MapState(
      {this.showMyRoute = false,
      this.isMapInitialized = false,
      this.isFollowingUser = true,
      required Map<String, Polyline> polylines})
      : polylines = polylines ?? const {};

  MapState copyWith(
          {bool? isMapInitialized,
          bool? isFollowingUser,
          bool? showMyRoute,
          Map<String, Polyline>? polylines}) =>
      MapState(
          isMapInitialized: isMapInitialized ?? this.isMapInitialized,
          isFollowingUser: isFollowingUser ?? this.isFollowingUser,
          polylines: polylines ?? this.polylines,
          showMyRoute: showMyRoute ?? this.showMyRoute);

  @override
  List<Object> get props =>
      [isMapInitialized, polylines, isFollowingUser, showMyRoute];
}

//class MapInitial extends MapState {}
