import 'package:flutter/widgets.dart';

/// base class for all validations.
abstract class Validation<T> {
  const Validation();

  /// Validates the given [value] and returns an error message if validation fails.
  ///
  /// if the validation passes, it should return `null`.
  String? validate(BuildContext context, T? value);
}
