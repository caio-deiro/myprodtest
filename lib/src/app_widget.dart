import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprodtest/src/home/bindings/home_bindings.dart';

import 'home/pages/home_page.dart';
import 'shared/constants/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme().defaultTheme,
        initialRoute: '/home',
        getPages: [
          GetPage(
            name: '/home',
            page: () => const HomePage(),
            binding: HomeBindings(),
          )
        ]);
  }
}
