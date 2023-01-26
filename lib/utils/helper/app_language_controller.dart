import 'dart:ui';

import '../../general_exports.dart';

class AppLanguageController extends GetxController {
  String appLocale = window.locale.toString().split('_')[0];
  LocalStorage localStorage = LocalStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
    final dynamic languageCode =
        await localStorage.getFromStorage(key: languageKey);
    appLocale = languageCode ?? appLocale;
    consoleLog('\x1B[33m App Language: $appLocale');
    Get.updateLocale(Locale(appLocale));
    update();
  }

  void changeLanguage(String value) {
    isRTL = value != 'en';
    appLocale = value;
    Get.updateLocale(Locale(appLocale));
    homeBottomBarController.update();
    localStorage.saveToStorage(key: languageKey, value: appLocale);
    update();
  }
}
