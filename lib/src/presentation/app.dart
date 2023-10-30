import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_test/core/services.dart';
import 'package:intern_test/src/presentation/bloc/details_bloc.dart';
import 'package:intern_test/src/presentation/pages/order_page.dart';

class App extends StatelessWidget {
  static final ThemeData appTheme = ThemeData(
    fontFamily: 'Roboto',
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFEA560D),
      background: Color(0xFF172027),
      secondary: Color(0xFF677482),
      tertiary: Color(0xFFA9B5C1),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto-Bold',
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto-Bold',
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto-Medium',
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto-Bold',
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Roboto-Regular',
        color: Color(0xFF677482),
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailsBloc>(
          create: (BuildContext context) =>
              services<DetailsBloc>(instanceName: 'first'),
        ),
        BlocProvider<DetailsBloc>(
          create: (BuildContext context) =>
              services<DetailsBloc>(instanceName: 'second'),
        ),
      ],
      child: MaterialApp(
        theme: appTheme,
        home: SafeArea(
          child: OrderPage(
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
