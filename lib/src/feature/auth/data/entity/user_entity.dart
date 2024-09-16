import 'package:equatable/equatable.dart';

abstract class UserEntity extends Equatable {
  const UserEntity();

  @override
  List<Object?> get props => [];

  bool get isAuthenticated;

  bool get isNotAuthenticated;

  factory UserEntity.notAuthenticated() => const NotAuthenticatedUserEntity();

  factory UserEntity.authenticated({
    required final int id,
  }) =>
      AuthenticatedUserEntity(id: id);

  T when<T extends Object?>({
    required final T Function(AuthenticatedUserEntity user) authenticated,
    required final T Function() notAuthenticated,
  });
}

class AuthenticatedUserEntity extends UserEntity {
  const AuthenticatedUserEntity({
    required this.id,
  });

  final int id;

  @override
  List<Object> get props => [super.props, id];

  @override
  bool get isAuthenticated => !isNotAuthenticated;

  @override
  bool get isNotAuthenticated => id != 0;

  @override
  T when<T extends Object?>({
    required final T Function(AuthenticatedUserEntity user) authenticated,
    required final T Function() notAuthenticated,
  }) =>
      authenticated(this);
}

class NotAuthenticatedUserEntity extends UserEntity {
  const NotAuthenticatedUserEntity();

  @override
  bool get isAuthenticated => false;

  @override
  bool get isNotAuthenticated => true;

  @override
  T when<T extends Object?>({
    required final T Function(AuthenticatedUserEntity user) authenticated,
    required final T Function() notAuthenticated,
  }) =>
      notAuthenticated();
}
