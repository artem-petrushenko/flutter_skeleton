import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/src/feature/auth/data/repository/auth_repository.dart';
import 'package:flutter_skeleton/src/feature/auth/logic/auth_interceptor.dart';

part 'auth_event.dart';

part 'auth_state.dart';

/// Set the state of the bloc
mixin SetStateMixin<S> on Emittable<S> {
  /// Change the state of the bloc
  void setState(S state) => emit(state);
}

/// AuthBloc
final class AuthBloc extends Bloc<AuthEvent, AuthState> with SetStateMixin {
  final AuthRepository<Object> _authRepository;

  /// Create an [AuthBloc]
  ///
  /// This specializes required initialState as it should be preloaded.
  AuthBloc(
    super.initialState, {
    required AuthRepository<Object> authRepository,
  }) : _authRepository = authRepository {
    on<AuthEvent>(
      (event, emit) => switch (event) {
        final _SignInWithEmailAndPassword e => _signInWithEmailAndPassword(e, emit),
        final _SignOut e => _signOut(e, emit),
      },
    );

    // emit new state when the authentication status changes
    authRepository.authStatus.map(($status) => AuthState.idle(status: $status)).listen(($state) {
      if ($state != state) {
        setState($state);
      }
    });
  }

  Future<void> _signOut(
    _SignOut event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState.processing(status: state.status));

    try {
      await _authRepository.signOut();
      emit(const AuthState.idle(status: AuthenticationStatus.unauthenticated));
    } on Object catch (e, stackTrace) {
      emit(
        AuthState.failure(
          status: AuthenticationStatus.unauthenticated,
          error: e,
        ),
      );
      onError(e, stackTrace);
    }
  }

  Future<void> _signInWithEmailAndPassword(
    _SignInWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState.processing(status: state.status));

    try {
      await _authRepository.signInWithEmailAndPassword(
        event.email,
        event.password,
      );
      emit(const AuthState.idle(status: AuthenticationStatus.authenticated));
    } on Object catch (e, stackTrace) {
      emit(
        AuthState.failure(
          status: AuthenticationStatus.unauthenticated,
          error: e,
        ),
      );
      onError(e, stackTrace);
    }
  }
}
