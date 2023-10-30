import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectAddressTextField extends StatefulWidget {
  const SelectAddressTextField({
    super.key,
    required this.textEditingControllerText,
  });

  final String textEditingControllerText;

  @override
  State<SelectAddressTextField> createState() => _SelectAddressTextFieldState();
}

class _SelectAddressTextFieldState extends State<SelectAddressTextField> {
  static const int textFieldMinLines = 2;
  static const int textFieldMaxLines = 4;

  static const BorderRadius containerBorderRadius =
      const BorderRadius.all(Radius.circular(12));
  static const containerPadding =
      const EdgeInsets.symmetric(horizontal: 16, vertical: 20);

  static const containerMargin =
      EdgeInsets.only(left: 20, right: 20, bottom: 20);

  bool formFieldState = false;

  void onTapOutside(PointerDownEvent _) {
    setState(() {
      formFieldState = false;
    });
  }

  void onTap() {
    setState(() {
      formFieldState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: containerMargin,
      padding: containerPadding,
      decoration: BoxDecoration(
        borderRadius: containerBorderRadius,
        color: colorScheme.background,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: TextField(
              enabled: formFieldState,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none,
              ),
              controller:
                  TextEditingController(text: widget.textEditingControllerText),
              keyboardType: TextInputType.multiline,
              minLines: textFieldMinLines,
              maxLines: textFieldMaxLines,
              onTapOutside: onTapOutside,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              'assets/icons/edit.svg',
            ),
          ),
        ],
      ),
    );
  }
}
