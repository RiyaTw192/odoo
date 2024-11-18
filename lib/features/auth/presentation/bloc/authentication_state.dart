class AuthenticationState {
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  final bool isValid;

  const AuthenticationState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.isValid = false,
  });

  AuthenticationState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    bool? isValid,
  }) {
    return AuthenticationState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError,
      passwordError: passwordError,
      isValid: isValid ?? this.isValid,
    );
  }
}
