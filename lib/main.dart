import 'package:flutter/material.dart';
import 'package:intern_test/core/services.dart';
import 'package:intern_test/src/presentation/app.dart';

void main() async {
  final WidgetsBinding _ = WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const App());
}
