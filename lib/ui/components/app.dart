import 'package:flutter/material.dart';

import '../../ui/pages/login/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color.fromRGBO(136, 14, 79, 1);
    final Color accentColor = Color.fromRGBO(136, 14, 79, 1);
    final Color backgroundColor = Color.fromRGBO(255, 255, 255, 1);

    final ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: primaryColor,
          secondary: accentColor,
          background: backgroundColor,
        )
      ),
    );
  }
}
