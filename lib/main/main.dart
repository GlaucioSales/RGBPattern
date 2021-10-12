import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'factory/pages/login/login_page_factory.dart';
import 'factory/pages/home/home_page_factory.dart';
import 'factory/pages/game/game_page_factory.dart';

import '../ui/components/components.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
      title: "RGB Pattern",

      debugShowCheckedModeBanner: false,

      theme: customAppTheme(),

      initialRoute: "/home",
            
      getPages: [
        GetPage(name: "/login", page: loginPageFactory),
        GetPage(name: "/home", page: homePageFactory),
        GetPage(name: "/game", page: gamePageFactory),
      ],

    );
  }
}
