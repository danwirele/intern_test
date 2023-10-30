part of 'details_bloc.dart';

@immutable
sealed class DetailsState {}

final class AddAddressDetailsState extends DetailsState {
  final int addressCount;

  AddAddressDetailsState({required this.addressCount});
}

final class SelectAddressDetailsState extends DetailsState {}
