import 'package:bloc/bloc.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<EmailValidation>(_onEmailValidation);
    on<PasswordValidation>(_onPasswordValidation);
  }

  void _onEmailValidation(
      EmailValidation event, Emitter<AuthenticationState> emit) {
    final emailError = _validateEmail(event.email);
    final isValid = _validateForm(event.email, state.password);
    emit(state.copyWith(
      email: event.email,
      emailError: emailError,
      isValid: isValid,
    ));
  }

  void _onPasswordValidation(
      PasswordValidation event, Emitter<AuthenticationState> emit) {
    final passwordError = _validatePassword(event.password);
    final isValid = _validateForm(state.email, event.password);
    emit(state.copyWith(
      password: event.password,
      passwordError: passwordError,
      isValid: isValid,
    ));
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  bool _validateForm(String email, String password) {
    return _validateEmail(email) == null && _validatePassword(password) == null;
  }
}
