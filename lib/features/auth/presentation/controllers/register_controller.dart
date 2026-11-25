import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/repositories/auth_repository_impl.dart';

part 'register_controller.g.dart';
part 'register_controller.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(false) bool isValid
  }) = _RegisterState;
}

@riverpod
class RegisterController extends _$RegisterController {
  String _email = '';
  String _username = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  RegisterState build() =>
    const RegisterState();

  void onEmailChanged(String email) {
    _email = email;
    _validate();
  }

  void onUsernameChanged(String username) {
    _username = username;
    _validate();
  }

  void onPasswordChanged(String password) {
    _password = password;
    _validate();
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    _confirmPassword = confirmPassword;
    _validate();
  }

  void _validate() {
    state = state.copyWith(
      isValid: RegExp(r'^\S+@\S+\.\S+$').hasMatch(_email) &&
        _username.isNotEmpty &&
        _password.isNotEmpty &&
        _confirmPassword.isNotEmpty &&
        (_password == _confirmPassword)
    );
  }

  Future<void> register() {
    return ref.read(authRepositoryProvider).register(_email, _username, _password);
  }
}