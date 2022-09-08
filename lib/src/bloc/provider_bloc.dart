import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/bloc/cat_breeds_bloc.dart';

class ProviderBloc extends InheritedWidget {
  final catBreedsBloc = CatBreedsBloc();

  ProviderBloc({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CatBreedsBloc catBreeds(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!.catBreedsBloc;
  }
}
