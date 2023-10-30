part of 'details_bloc.dart';

@immutable
sealed class DetailsEvent {}

final class ChangeDetailsEvent extends DetailsEvent {}

final class AddAddressDetailsEvent extends DetailsEvent {}
