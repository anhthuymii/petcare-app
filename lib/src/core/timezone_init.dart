import 'dart:developer' as dev;


import '../config/app_config.dart';

initAppTimezone() {
 // tz.initializeTimeZones();
  dev.log('initialize timezone', name: AppConfig.packageName);
}
