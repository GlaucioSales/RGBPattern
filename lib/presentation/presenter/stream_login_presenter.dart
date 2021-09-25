import 'dart:async';
import 'package:meta/meta.dart';
import 'package:rgb_pattern/domain/errors/errors.dart';
import 'package:rgb_pattern/ui/pages/login/login.dart';

import '../../domain/use_cases/use_cases.dart';
import '../protocols/protocols.dart';

class LoginState {
  String email;
  String password;
  String emailError;
  String passwordError;
  String mainError;
  bool isLoading = false;

  bool get isFormValid =>
    emailError == null && passwordError == null &&
    email != null && password != null ;
}

class StreamLoginPresenter extends LoginPresenter{
  final Validation validation;
  final Authentication authentication;
  var _state = LoginState();

  StreamLoginPresenter({@required this.validation, @required this.authentication});

  StreamController<LoginState> _controller =
      StreamController<LoginState>.broadcast();

  Stream<String> get emailErrorStream =>
      _controller?.stream?.map((state) => state.emailError)?.distinct();
  Stream<String> get passwordErrorStream =>
      _controller?.stream?.map((state) => state.passwordError)?.distinct();
  Stream<String> get mainErrorStream =>
      _controller?.stream?.map((state) => state.mainError)?.distinct();
  Stream<bool> get isFormValidStream =>
      _controller?.stream?.map((state) => state.isFormValid)?.distinct();
  Stream<bool> get isLoadingStream =>
      _controller?.stream?.map((state) => state.isLoading)?.distinct();

  void update() => _controller?.add(_state);

  void validateEmail(String email) {
    _state.email = email;
    _state.emailError = validation.validate(field: 'email', value: email);
    update();
  }
  void validatePassword(String password) {
    _state.password = password;
    _state.passwordError = validation.validate(field: 'password', value: password);
    update();
  }

  Future<void> auth() async {
    _state.isLoading = true;
    update();
    try{
      await authentication.auth(AuthenticationParams(email: _state.email, secret: _state.password));
    }on DomainError catch (error) {
      _state.mainError = error.description;
    }
    _state.isLoading = false;
    update();
  }

  void dispose() {
    _controller.close();
    _controller = null;
  }
}
