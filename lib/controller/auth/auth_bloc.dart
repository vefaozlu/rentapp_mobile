import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rent_app/service/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _service;

  AuthBloc({required AuthService authService})
      : _service = authService,
        super(const AuthState._()) {
    on<Login>(_onLogin);
    on<CheckToken>(_onCheckToken);
    on<Logout>(_onLogout);
  }

  Future<void> _onCheckToken(CheckToken event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final bool isTokenValid = await _service.checkToken();

    if (isTokenValid) {
      emit(const AuthState.authenticated());
    } else {
      emit(const AuthState.initial());
    }
  }

  Future<void> _onLogin(Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await _service.login(email: event.email, password: event.password);
      emit(const AuthState.authenticated());
    } on Exception catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  Future<void> _onLogout(Logout event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    await _service.logout();

    emit(const AuthState.initial());
  }
}
