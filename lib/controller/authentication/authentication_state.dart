part of 'authentication_cubit.dart';

enum AuthenticationStatus { authenticating, authenticated, unauthenticated }

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.status = AuthenticationStatus.authenticating,
  });

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}
