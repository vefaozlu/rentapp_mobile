part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, authenticated, failure }

class AuthState extends Equatable {
  const AuthState._({this.status = AuthStatus.initial, this.message = ""});

  const AuthState.initial() : this._(status: AuthStatus.initial, message: "");

  const AuthState.loading() : this._(status: AuthStatus.loading, message: "");

  const AuthState.authenticated()
      : this._(
          status: AuthStatus.authenticated,
          message: "",
        );

  const AuthState.failure(String message)
      : this._(
          status: AuthStatus.failure,
          message: message,
        );

  final AuthStatus status;
  final String message;

  @override
  List<Object> get props => [status, message];
}
