import 'dart:async';

import '../../general_exports.dart';

class SplashController extends GetxController {
  @override
  Future<void> onReady() async {
    super.onReady();
    // if (myAppController.)
    Timer(
      const Duration(seconds: 2),
      () {
        consoleLog(myAppController.userData, key: 'inSplash');

        Get.offAndToNamed(
          // && myAppController.userData?['profile_complete']
          myAppController.userData != null
              ? myAppController.userData['isProfileComplete']
                  ? routeHomeBottomBar
                  : routeCompleteProfile
              : routeLogin,
        );
      },
    );
  }
}
