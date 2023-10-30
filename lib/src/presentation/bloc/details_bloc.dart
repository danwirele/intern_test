import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  List<bool> isSelected = [true, false];
  DetailsBloc() : super(AddAddressDetailsState(addressCount: 1)) {
    on<ChangeDetailsEvent>(onChangeDetailsEvent);
    on<AddAddressDetailsEvent>(onAddAddressDetailsEvent);
  }

  FutureOr<void> onChangeDetailsEvent(
    ChangeDetailsEvent _,
    Emitter<DetailsState> emit,
  ) {
    if (isSelected[0]) {
      emit(AddAddressDetailsState(addressCount: 1));
    }
    if (isSelected[1]) {
      emit(SelectAddressDetailsState());
    }
  }

  FutureOr<void> onAddAddressDetailsEvent(
    AddAddressDetailsEvent _,
    Emitter<DetailsState> emit,
  ) {
    final AddAddressDetailsState newState = AddAddressDetailsState(
      addressCount: ((state as AddAddressDetailsState).addressCount) + 1,
    );

    emit(newState);
  }
}
