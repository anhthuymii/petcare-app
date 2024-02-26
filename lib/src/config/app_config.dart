import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';


class AppConfig {
  static Locale get locale {
    return const Locale("vi");
  }

  /// fallback locale
  static const fallbackLocale = Locale('en');

  /// package name
  static const String packageName = "pet_care";

  /// storage box
  static const String storageBox = packageName;

  /// default transition
  static const Transition defaultTransition = Transition.fadeIn;

  /// initial route
  static String get initialRoute {
    return "/pet_care_home";
  }

  static const Color materialMainBlueColor = Color.fromRGBO(21, 101, 192, 1);
}
