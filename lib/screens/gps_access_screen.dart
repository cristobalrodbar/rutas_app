import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_flutter/blocs/gps/gps_bloc.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        Center(child: BlocBuilder<GpsBloc, GpsState>(builder: (context, state) {
      return !state.isGpsEnabled
          ? const _EnableGpsMessage()
          : const _AccesButton();
    })));
  }
}

class _AccesButton extends StatelessWidget {
  const _AccesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario el acceso a GPS'),
        MaterialButton(
          onPressed: () {
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            //final gpsBloc = context.read<GpsBloc>();
            gpsBloc.askGpsAccess();
          },
          color: Colors.black,
          shape: const StadiumBorder(),
          elevation: 0,
          splashColor: Colors.transparent,
          child: const Text(
            'Solcitar acceso',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Debe habilitar el GPS',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
    );
  }
}
