import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/repositories/auth_repository_impl.dart';

part 'login_controller.g.dart';
part 'login_controller.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isValid
  }) = _LoginState;
}

@riverpod
class LoginController extends _$LoginController {
  String _email = '';
  String _password = '';

  @override
  LoginState build() =>
    const LoginState();

  void onEmailChanged(String email) {
    _email = email;
    _validate();
  }

  void onPasswordChanged(String password) {
    _password = password;
    _validate();
  }

  void _validate() {
    state = state.copyWith(
      isValid: RegExp(r'^\S+@\S+\.\S+$').hasMatch(_email) &&
        _password.isNotEmpty
    );
  }

  Future<void> login() {
    return ref.read(authRepositoryProvider).login(_email, _password);
  }
}