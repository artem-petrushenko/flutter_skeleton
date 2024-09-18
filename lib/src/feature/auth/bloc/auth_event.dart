part of 'auth_bloc.dart';

/// Events for [AuthBloc]
sealed class AuthEvent {
  const AuthEvent();

  /// Event to sign in with Email and Password
  const factory AuthEvent.signInWithEmailAndPassword({
    required String email,
    required String password,
  }) = _SignInWithEmailAndPassword;

  /// Event to sign out
  const factory AuthEvent.signOut() = _SignOut;
}

final class _SignInWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  const _SignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });
}

final class _SignOut extends AuthEvent {
  const _SignOut();
}
