import 'package:flutter_skeleton/src/feature/auth/data/entity/user_entity.dart';
import 'package:meta/meta.dart';

class AuthenticatedUserDTO extends AuthenticatedUserEntity {
  const AuthenticatedUserDTO({
    required super.id,
  });

  @override
  String toString() => 'Authenticated user with id: $id';

  @override
  bool operator ==(final Object other) => other is AuthenticatedUserDTO;

  @override
  int get hashCode => id.hashCode;

  factory AuthenticatedUserDTO.fromJson(Map<String, dynamic> json) => AuthenticatedUserDTO(
        id: json['id'] as int,
      );
}

@immutable
class NotAuthenticatedUserDTO extends NotAuthenticatedUserEntity {
  @literal
  const NotAuthenticatedUserDTO();

  @override
  String toString() => 'User is not authenticated';

  @override
  bool operator ==(final Object other) => other is NotAuthenticatedUserDTO;

  @override
  int get hashCode => 0;
}
