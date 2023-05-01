import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rent_app/model/models/authentication_client.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.client) : super(const AuthenticationState());
  final AuthenticationClient client;

  void verifyToken() async {
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "token");
    if (token == null) {
      emit(const AuthenticationState(
          status: AuthenticationStatus.unauthenticated));
      return;
    }
    try {
      await client.verify(token);
      emit(const AuthenticationState(
          status: AuthenticationStatus.authenticated));
    } catch (error) {
      emit(const AuthenticationState(
          status: AuthenticationStatus.unauthenticated));
    }
  }

  void login(String username, String password) async {
    emit(
        const AuthenticationState(status: AuthenticationStatus.authenticating));
    final storage = FlutterSecureStorage();
    try {
      String? token = await client.login(username, password);
      print(token);
      await storage.delete(key: "token");
      await storage.write(key: "token", value: token!);
      emit(const AuthenticationState(
          status: AuthenticationStatus.authenticated));
    } catch (error) {
      emit(const AuthenticationState(
          status: AuthenticationStatus.unauthenticated));
    }
  }
}
