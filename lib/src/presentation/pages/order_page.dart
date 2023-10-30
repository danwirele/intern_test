// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_test/core/services.dart';
import 'package:intern_test/src/presentation/bloc/details_bloc.dart';
import 'package:intern_test/src/presentation/widgets/order/date_picker.dart';
import 'package:intern_test/src/presentation/widgets/order/details/details.dart';
import 'package:intern_test/src/presentation/widgets/order/intern_app_bar.dart';
import 'package:intern_test/src/presentation/widgets/order/details/intern_toggle_buttons.dart';
import 'package:intern_test/src/presentation/widgets/order/step_counter.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatelessWidget {
  static const EdgeInsets buttonTextPadding =
      EdgeInsets.symmetric(vertical: 18);
  static const BorderRadius buttonBorderRadius =
      const BorderRadius.all(Radius.circular(50));

  final void Function()? onTap;

  const OrderPage({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: services<ScrollController>(),
        slivers: [
          const InternAppBar(),
          const StepCounter(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                DatePicker(dateInit: DateTime.now()),
                const SizedBox(
                  height: 16,
                ),
                Details(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape:
                      RoundedRectangleBorder(borderRadius: buttonBorderRadius),
                  backgroundColor: const Color(0xFFEA560D),
                ),
                onPressed: onTap,
                child: Padding(
                  padding: buttonTextPadding,
                  child: Text(
                    'Next step',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
