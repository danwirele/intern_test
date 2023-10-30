import 'package:flutter/material.dart';
import 'package:intern_test/core/services.dart';
import 'package:intern_test/src/presentation/bloc/details_bloc.dart';
import 'package:intern_test/src/presentation/widgets/order/details/intern_text_form_field.dart';

class AddAddress extends StatelessWidget {
  static const smallSizedBox = SizedBox(height: 12);
  static const mediumSizedBox = SizedBox(height: 20);

  static const emailRegExp =
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  final DetailsBloc bloc;

  const AddAddress({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InternTextFormField(
          hintText: 'Danilev Egor',
          iconPath: 'assets/icons/people.svg',
          name: 'Full name*',
          messageTextFormField: 'Please, type ur Surname and Name',
          formRegExp: r'^\S+\s+\S+$',
        ),
        smallSizedBox,
        InternTextFormField(
          hintText: 'egor_zu@email.com',
          iconPath: 'assets/icons/email.svg',
          name: 'Email*',
          messageTextFormField: 'Please, type ur email',
          formRegExp: emailRegExp,
        ),
        smallSizedBox,
        InternTextFormField(
          hintText: '+375726014690',
          iconPath: 'assets/icons/phone.svg',
          name: 'Phone number*',
          messageTextFormField: 'Please, type ur phone number',
          formRegExp: r'^\+375\d{9}$',
        ),
        smallSizedBox,
        InternTextFormField(
          hintText: 'Belarus',
          iconPath: 'assets/icons/country.svg',
          name: 'Country*',
          messageTextFormField: 'Please, type ur Country',
          formRegExp: r'[A-Za-z]+',
        ),
        smallSizedBox,
        InternTextFormField(
          hintText: 'Minsk',
          iconPath: 'assets/icons/city.svg',
          name: 'City*',
          messageTextFormField: 'Please, type ur City',
          formRegExp: r'[A-Za-z]+',
        ),
        smallSizedBox,
        ListView.builder(
          itemCount: (bloc.state as AddAddressDetailsState).addressCount,
          controller: services<ScrollController>(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                InternTextFormField(
                  hintText: 'Derzhinskogo 3b',
                  iconPath: 'assets/icons/address_line.svg',
                  name: 'Addres line ${index + 1}*',
                  messageTextFormField: 'Please, type ur Address',
                  formRegExp: r'\w',
                ),
                smallSizedBox,
              ],
            );
          },
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextButton(
              onPressed: () => bloc.add(AddAddressDetailsEvent()),
              child: Text(
                'Add address line +',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
        ),
        smallSizedBox,
        InternTextFormField(
          hintText: '220069',
          iconPath: 'assets/icons/postcode.svg',
          name: 'Postcode*',
          messageTextFormField: 'Please, type ur Postcode',
          formRegExp: r'^\d{6}$',
        ),
        mediumSizedBox,
      ],
    );
  }
}
