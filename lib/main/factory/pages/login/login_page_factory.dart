
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rgb_pattern/infra/http/http_adapter.dart';
import '../../../../data/use_cases/use_cases.dart';
import '../../../../presentation/presenter/presenter.dart';
import '../../../../validation/validators/validators.dart';
import '../../../../ui/pages/login/login.dart';

Widget loginPageFactory (){
  return LoginPage(presenter: StreamLoginPresenter(
    authentication: RemoteAuthentication(
      url: "http://fordevs.herokuapp.com/api/login",
      httpClient: HttpAdapter(
        client: Client()
      ),
    ),

    validation: ValidationComposite(validations: [
      EmailValidation('email'),
      RequiredFieldValidation('email'),
      RequiredFieldValidation('password'),
    ]),
  ));
}