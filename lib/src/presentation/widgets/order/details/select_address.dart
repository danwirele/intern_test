import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_test/src/presentation/widgets/order/details/select_address_text_field.dart';

class SelectAddress extends StatelessWidget {
  static const SizedBox sizedBoxHeight = SizedBox(height: 12);
  static const SizedBox sizedBoxHeightSecond = SizedBox(height: 6);
  static const String textEditingControllerText = '''Denilev Egor
Belarus, Minsk, Derzhinskogo 3b, 80100''';

  static const EdgeInsets textFieldContentPadding =
      const EdgeInsets.only(top: 16);
  static const BorderRadius textFieldBorderRadius =
      const BorderRadius.all(Radius.circular(10.0));

  const SelectAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextStyle? bodyMedium = Theme.of(context).textTheme.bodyMedium;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.tertiary),
                borderRadius: textFieldBorderRadius,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.tertiary),
                borderRadius: textFieldBorderRadius,
              ),
              hintText: 'Search',
              hintStyle: bodyMedium,
              contentPadding: textFieldContentPadding,
              isDense: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                ),
              ),
            ),
          ),
        ),
        sizedBoxHeight,
        SelectAddressTextField(
          textEditingControllerText: textEditingControllerText,
        ),
        sizedBoxHeightSecond,
      ],
    );
  }
}
