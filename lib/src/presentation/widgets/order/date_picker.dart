import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    required DateTime dateInit,
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  static const sizedBoxHeight = SizedBox(height: 8.0);
  static const containerBorderRadius =
      const BorderRadius.all(Radius.circular(12.0));
  DateTime dateInit = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateInit,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != dateInit) {
      if (!mounted) return;
      setState(() {
        dateInit = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Start date',
            style: textTheme.displayMedium,
          ),
          sizedBoxHeight,
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.fromBorderSide(
                  BorderSide(color: colorScheme.tertiary),
                ),
                borderRadius: containerBorderRadius,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/icons/date.svg',
                    ),
                  ),
                  Text(
                    DateFormat('MMM dd, yyyy').format(dateInit),
                    style: textTheme.bodyMedium
                        ?.copyWith(color: colorScheme.background),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
