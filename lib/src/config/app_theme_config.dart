import 'package:flutter/material.dart';

import 'app_config.dart';

class AppThemeConfig {
  static ThemeData get customTheme {
    return ThemeData(
        fontFamily: 'Roboto',
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppConfig.materialMainBlueColor,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              primary: AppConfig.materialMainBlueColor,
              side: const BorderSide(color: AppConfig.materialMainBlueColor)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(AppConfig.materialMainBlueColor),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppConfig.materialMainBlueColor,
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          primary: AppConfig.materialMainBlueColor,
        )),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: AppConfig.materialMainBlueColor),
        sliderTheme: SliderThemeData(
          activeTrackColor: const Color(0xFF5E92F3),
          inactiveTrackColor: const Color(0xFFD9D9D9),
          overlayShape: SliderComponentShape.noOverlay,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
        ),
        switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.all(const Color(0xFF1565C0)),
            trackColor: MaterialStateProperty.all(const Color(0xFFD9D9D9))));
  }
}
