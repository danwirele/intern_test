import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InternTextFormField extends StatelessWidget {
  static const SizedBox sizedBoxHeight = const SizedBox(height: 8);

  static const BorderRadius textFieldBorderRadius =
      const BorderRadius.all(Radius.circular(10.0));

  static const double iconWidth = 20.0;
  static const double iconHeight = 20.0;

  final String hintText;
  final String iconPath;
  final String name;

  final String messageTextFormField;
  final String formRegExp;

  const InternTextFormField({
    super.key,
    required this.hintText,
    required this.iconPath,
    required this.name,
    required this.messageTextFormField,
    required this.formRegExp,
  });

  String? validate(String? value) {
    if (value != null) {
      RegExp nameRegex = RegExp(formRegExp);
      if (!nameRegex.hasMatch(value)) {
        return messageTextFormField;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: textTheme.displayMedium,
          ),
          sizedBoxHeight,
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              style: textTheme.bodyMedium,
              validator: validate,
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.tertiary),
                  borderRadius: textFieldBorderRadius,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.tertiary),
                  borderRadius: textFieldBorderRadius,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.tertiary),
                  borderRadius: textFieldBorderRadius,
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: textFieldBorderRadius,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.tertiary),
                  borderRadius: textFieldBorderRadius,
                ),
                hintText: hintText,
                hintStyle: TextStyle(),
                // contentPadding: textFieldContentPadding,
                isDense: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SvgPicture.asset(
                    iconPath,
                    width: iconWidth,
                    height: iconHeight,
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
