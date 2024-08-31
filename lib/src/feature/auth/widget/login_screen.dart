import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/common/widget/scaffold/logger_scaffold.dart';

import 'package:flutter_skeleton/src/feature/auth/widget/auth_scope.dart';

/// {@template login_screen}
/// LoginScreen widget
/// {@endtemplate}
class LoginScreen extends StatefulWidget {
  /// {@macro login_screen}
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _passwordController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoggerScaffold(
      body: Center(
        child: SingleChildScrollView(
          // padding: ScreenPadding.of(context, 468),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 48,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
              ),
              _PasswordTextField(controller: _passwordController),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: SizedBox(
                  height: 48,
                  child: FilledButton(
                    onPressed: () {
                      AuthScope.of(context).signInWithEmailAndPassword(
                        _emailController.text,
                        _passwordController.text,
                      );
                    },
                    child: const Text(
                      'Sign in',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// {@template password_text_field}
/// _PasswordTextField widget
/// {@endtemplate}
class _PasswordTextField extends StatefulWidget {
  /// {@macro password_text_field}
  const _PasswordTextField({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 48,
      child: ValueListenableBuilder(
        valueListenable: _obscureText,
        builder: (BuildContext context, bool obscureText, Widget? child) {
          return TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: theme.colorScheme.onSurface,
                ),
                onPressed: () {
                  _obscureText.value = !_obscureText.value;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
