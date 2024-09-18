part of 'auth_bloc.dart';

/// States for [AuthBloc]
sealed class AuthState {
  const AuthState({required this.status});

  /// Status of the authentication
  final AuthenticationStatus status;

  /// Idle state, state machine is doing nothing
  const factory AuthState.idle({
    required AuthenticationStatus status,
  }) = _AuthStateIdle;

  const factory AuthState.processing({
    required AuthenticationStatus status,
  }) = _AuthStateProcessing;

  const factory AuthState.failure({
    required AuthenticationStatus status,
    required Object error,
  }) = _AuthStateFailure;

  /// Get error if state is error
  Object? get error => switch (this) {
        final _AuthStateFailure e => e.error,
        _ => null,
      };
}

final class _AuthStateIdle extends AuthState {
  const _AuthStateIdle({required super.status});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _AuthStateIdle && other.status == status;
  }

  @override
  int get hashCode => Object.hashAll([status]);

  @override
  String toString() => '_AuthStateIdle(status: $status)';
}

final class _AuthStateProcessing extends AuthState {
  const _AuthStateProcessing({required super.status});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _AuthStateProcessing && other.status == status;
  }

  @override
  int get hashCode => Object.hashAll([status]);

  @override
  String toString() => '_AuthStateProcessing(status: $status)';
}

final class _AuthStateFailure extends AuthState {
  @override
  final Object error;

  const _AuthStateFailure({
    required this.error,
    required super.status,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _AuthStateFailure && other.status == status && other.error == error;
  }

  @override
  int get hashCode => Object.hashAll([status, error]);

  @override
  String toString() => '_AuthStateError(status: $status, message: $error)';
}
