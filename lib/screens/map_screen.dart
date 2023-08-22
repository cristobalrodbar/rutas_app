import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_flutter/blocs/blocs.dart';
import 'package:maps_flutter/blocs/location/location_bloc.dart';
import 'package:maps_flutter/views/views.dart';
import 'package:maps_flutter/widgets/widgets.dart';

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
    locationBloc = BlocProvider.of<LocationBloc>(context);
    //locationBloc.getcurrentPosition();
    locationBloc.startFollowingUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, LocationState) {
          if (LocationState.lastKnownLocation == null) {
            return const Center(child: Text('espere por favor'));
          }

          return BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    MapView(
                      initialLocation: LocationState.lastKnownLocation!,
                      polylines: mapState.polylines.values.toSet(),
                    ),
                    //TODO botones...
                  ],
                ),
              );
            },
          );

          //return const MapView();
          /* Center(
            child: Text(
                '${state.lastKnownLocation!.latitude},${state.lastKnownLocation!.longitude}')); */
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [BtnCurrentLocation(), BtnFollowUser()],
      ),
    );
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }
}
