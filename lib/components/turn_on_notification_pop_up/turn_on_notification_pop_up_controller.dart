import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../general_exports.dart';

class TurnOnNotificationRequestController extends GetxController {
  bool isDone = false;
  LocalStorage localStorage = LocalStorage();

  @override
  void onInit() {
    super.onInit();
    timer();
  }

  Future<void> checkNotification() async {
    final NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();

    if ((settings.authorizationStatus == AuthorizationStatus.authorized ||
            settings.authorizationStatus == AuthorizationStatus.provisional) &&
        !isDone) {
      isDone = true;
      Get.back();
    }
  }

  Timer timer({bool close = false}) => Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) {
          checkNotification();
          if (close) {
            timer.cancel();
          }
        },
      );

  Future<void> onPressDoNotShowAgain() async {
    await localStorage.saveToStorage(
        key: storeNotificationPermission, value: false);
    Get.back();
  }

  @override
  void onClose() {
    super.onClose();
    timer(close: true);
  }
}
