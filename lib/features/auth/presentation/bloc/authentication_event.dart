abstract class AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class EmailValidation extends AuthenticationEvent {
  final String email;

  EmailValidation(this.email);
}

class PasswordValidation extends AuthenticationEvent {
  final String password;

  PasswordValidation(this.password);
}