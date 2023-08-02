import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'register_form_state.dart';

class RegisterFormCubit extends Cubit<RegisterFormState> {
  RegisterFormCubit() : super(const RegisterFormState());

  void onValueChanged(
      {String? name,
      String? surname,
      String? username,
      String? email,
      String? phoneNumber,
      String? address,
      String? city,
      String? zipCode,
      String? password}) {
    emit(state.copyWith(
      name: name,
      surname: surname,
      username: username,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      city: city,
      zipCode: zipCode,
      password: password,
    ));
  }
}
