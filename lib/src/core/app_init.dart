import 'dart:developer';


import '../config/app_config.dart';
import '../config/package_config.dart';
import '../core/translation_init.dart';
import 'hive_init.dart';
import 'timezone_init.dart';

Future initApp() async {
  log("initialize application", name: AppConfig.packageName);
 // await GetStorage.init();
  await initHive();
  await initHivePackages();
  await initAppTimezone();
  await initAppTranslation();
  await initPackages();
}
