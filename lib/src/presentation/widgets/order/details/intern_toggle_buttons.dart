// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intern_test/src/presentation/bloc/details_bloc.dart';

class InternToggleButtons extends StatelessWidget {
  static const double buttonWidth = 170.0;
  static const int buttonCount = 2;
  static const BorderRadius buttonBorderRadius =
      const BorderRadius.all(Radius.circular(36));
  static const Color unselectedButtonColor = Color(0xFFE7ECF0);
  static const Color unselectedButtonTextColor = Color(0xFF919EAB);

  static const List<String> titleList = const ['Add address', 'Select address'];

  static const Color transparent = Colors.transparent;

  final DetailsBloc bloc;

  const InternToggleButtons({
    super.key,
    required this.bloc,
  });

  void onPressed(int index) {
    if (index == 0) {
      bloc.isSelected.first = true;
      bloc.isSelected.last = false;
      bloc.add(ChangeDetailsEvent());
    } else {
      bloc.isSelected.first = false;
      bloc.isSelected.last = true;
      bloc.add(ChangeDetailsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      renderBorder: false,
      splashColor: transparent,
      fillColor: Colors.white,
      onPressed: onPressed,
      isSelected: bloc.isSelected,
      children: List.generate(
        buttonCount,
        (index) => Container(
          margin: const EdgeInsets.all(4.0),
          width: buttonWidth,
          decoration: BoxDecoration(
            borderRadius: buttonBorderRadius,
            color: bloc.isSelected[index]
                ? Theme.of(context).colorScheme.primary
                : unselectedButtonColor,
          ),
          alignment: Alignment.center,
          child: Text(
            titleList[index],
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: bloc.isSelected[index]
                      ? Colors.white
                      : unselectedButtonTextColor,
                ),
          ),
        ),
      ),
    );
  }
}
