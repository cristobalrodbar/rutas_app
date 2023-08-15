import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_flutter/blocs/location/location_bloc.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    super.initState();
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    //locationBloc.getcurrentPosition();
    locationBloc.startFollowingUser();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('MAP SCREEN'),
    ));
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }
}
