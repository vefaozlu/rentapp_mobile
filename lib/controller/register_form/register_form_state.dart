part of 'register_form_cubit.dart';

class RegisterFormState extends Equatable {
  const RegisterFormState({
    this.name = "",
    this.surname = "",
    this.username = "",
    this.email = "",
    this.phoneNumber = "",
    this.address = "",
    this.city = "",
    this.zipCode = "",
    this.password = "",
  });

  final String name;
  final String surname;
  final String username;
  final String email;
  final String phoneNumber;
  final String address;
  final String city;
  final String zipCode;
  final String password;

  RegisterFormState copyWith(
      {String? name,
      String? surname,
      String? username,
      String? email,
      String? phoneNumber,
      String? address,
      String? city,
      String? zipCode,
      String? password}) {
    return RegisterFormState(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        name,
        surname,
        username,
        email,
        phoneNumber,
        address,
        city,
        zipCode,
        password,
      ];
}
