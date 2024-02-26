import 'dart:developer';


import 'app_config.dart';


const packageMap = {
 // "ics_common": pet_care_common.initPackage,
};

initPackages() async {
  log('initialize packages', name: AppConfig.packageName);
  await _initPackage();
}

_initPackage() async {
  for (var key in packageMap.keys) {
    var value = packageMap[key];
    try {
      await value?.call();
    } catch (_) {}
  }
}

initHivePackages() async {
  // var tmpDir = await getTemporaryDirectory();
  // for (var key in packageMap.keys) {
  //   await Hive.openBox(key, path: tmpDir.path);
  // }
}
