// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_test/core/services.dart';
import 'package:intern_test/src/presentation/bloc/details_bloc.dart';
import 'package:intern_test/src/presentation/widgets/not_found_widget.dart';
import 'package:intern_test/src/presentation/widgets/order/details/add_address.dart';
import 'package:intern_test/src/presentation/widgets/order/details/select_address.dart';
import 'package:intern_test/src/presentation/widgets/order/details/intern_toggle_buttons.dart';

class Details extends StatelessWidget {
  static const SizedBox sizedBoxHeight = SizedBox(height: 20);

  const Details({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DetailsBloc firstDetailsBloc =
        services<DetailsBloc>(instanceName: 'first');

    final DetailsBloc secondDetailsBloc =
        services<DetailsBloc>(instanceName: 'second');

    final TextStyle? textStyle = Theme.of(context).textTheme.labelMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 12),
          child: Text(
            'Sender details',
            style: textStyle,
          ),
        ),
        BlocBuilder(
          bloc: firstDetailsBloc,
          builder: (context, state) {
            final InternToggleButtons firstButtons = InternToggleButtons(
              bloc: firstDetailsBloc,
            );
            if (state is AddAddressDetailsState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: firstButtons,
                  ),
                  sizedBoxHeight,
                  AddAddress(bloc: firstDetailsBloc),
                ],
              );
            }
            if (state is SelectAddressDetailsState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: firstButtons,
                  ),
                  sizedBoxHeight,
                  SelectAddress(),
                ],
              );
            }

            return NotFoundWidget();
          },
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 12),
          child: Text(
            'Recipient details',
            style: textStyle,
          ),
        ),
        BlocBuilder(
          bloc: secondDetailsBloc,
          builder: (context, state) {
            final InternToggleButtons secondButtons = InternToggleButtons(
              bloc: secondDetailsBloc,
            );
            if (state is AddAddressDetailsState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: secondButtons,
                  ),
                  sizedBoxHeight,
                  AddAddress(bloc: secondDetailsBloc),
                ],
              );
            }
            if (state is SelectAddressDetailsState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: secondButtons,
                  ),
                  sizedBoxHeight,
                  SelectAddress(),
                ],
              );
            }

            return NotFoundWidget();
          },
        ),
      ],
    );
  }
}
