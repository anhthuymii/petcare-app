import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../signin.dart';
import '../config/app_config.dart';
import '../config/app_theme_config.dart';

class PetCareApp extends StatefulWidget {
  const PetCareApp({Key? key}) : super(key: key);

  @override
  State<PetCareApp> createState() => _PetCareAppState();
}

class _PetCareAppState extends State<PetCareApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // initialRoute: AppConfig.initialRoute,
        home: const SignIn(),
        debugShowCheckedModeBanner: false,
        defaultTransition: AppConfig.defaultTransition,
        locale: AppConfig.locale,
        fallbackLocale: AppConfig.fallbackLocale,
        theme: AppThemeConfig.customTheme,
       // getPages: GetPageCenter.pages,
        translationsKeys: Get.translations,
        supportedLocales: const [
          Locale('en', 'US'), // English
          Locale('vi', 'VN'),
        ],
        localizationsDelegates: const [
          // GlobalMaterialLocalizations.delegate,
          // GlobalWidgetsLocalizations.delegate,
          // GlobalCupertinoLocalizations.delegate,
        ]);
  }
}
