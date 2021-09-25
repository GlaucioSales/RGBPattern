import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../main/factory/pages/login/login_page_factory.dart';
import '../main/factory/pages/home/home_page_factory.dart';

import '../ui/components/components.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
      title: "Project Pattern",

      debugShowCheckedModeBanner: false,

      theme: customAppTheme(),

      initialRoute: "/login",
            
      getPages: [
        GetPage(name: "/login", page: loginPageFactory),
        GetPage(name: "/home", page: homePageFactory),
      ],

    );
  }
}
