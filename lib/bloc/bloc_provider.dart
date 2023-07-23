import 'package:flutter/material.dart';

import 'bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final T bloc;
  final Widget child;

  const BlocProvider({super.key, required this.bloc, required this.child});

  static T? of<T extends Bloc>(BuildContext context) {
    final provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider?.bloc;
  }

  @override
  ProviderState createState() => ProviderState();

}

class ProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

}