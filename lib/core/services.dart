import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intern_test/src/presentation/bloc/details_bloc.dart';

final GetIt services = GetIt.I;

FutureOr<void> initServices() {
  services.registerLazySingleton<DetailsBloc>(
    () => DetailsBloc(),
    instanceName: 'first',
  );
  services.registerLazySingleton<DetailsBloc>(
    () => DetailsBloc(),
    instanceName: 'second',
  );

  services.registerLazySingleton<ScrollController>(() => ScrollController());
}
