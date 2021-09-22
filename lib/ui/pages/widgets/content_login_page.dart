import 'package:flutter/material.dart';
import 'package:rgb_pattern/ui/pages/widgets/widgets.dart';


import '../login/login.dart';

class ContentLoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  ContentLoginPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    presenter.mainErrorStream.listen((error) {
      if (error != null) {
        showErrorMessage(context: context, error: error);
      }
    });

    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(32, 64, 32, 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWelcomeBack(),
            FormLogin(presenter),
            SignInLogin(presenter),
            LoginWithSocial(),
            SignUpAndForgetPassword(),
          ],
        ),
      ),
    );
  }
}
