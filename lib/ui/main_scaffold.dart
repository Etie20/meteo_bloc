import 'package:flutter/material.dart';
import 'package:meteo_bloc/bloc/bloc_location.dart';
import 'package:meteo_bloc/bloc/bloc_provider.dart';
import 'package:meteo_bloc/ui/location_widget.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma météo BLoC"),
        elevation: 7,
      ),
      body: BlocProvider<BlocLocation>(
          bloc: BlocLocation(),
          child: const LocationWidget()
      ),
    );
  }

}