import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meteo_bloc/bloc/bloc_location.dart';
import 'package:meteo_bloc/bloc/bloc_provider.dart';
import 'package:meteo_bloc/bloc/bloc_weather.dart';
import 'package:meteo_bloc/services/api_service.dart';
import 'package:meteo_bloc/ui/weather_widget.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocLocation>(context);
    return StreamBuilder<Position>(
        stream: bloc?.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ApiService(position: snapshot.data!).callAPI();
          }
          return (snapshot.hasData)
              ? BlocProvider(
              bloc: BlocWeather(),
              child: WeatherWidget(position: snapshot.data!))
              : const Center(child: CircularProgressIndicator(),);
        }
    );
  }

}