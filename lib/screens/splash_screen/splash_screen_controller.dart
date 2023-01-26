import 'dart:async';

import '../../general_exports.dart';

class SplashController extends GetxController {
  @override
  Future<void> onReady() async {
    super.onReady();

    Timer(
      const Duration(seconds: 3),
      () => Get.offAndToNamed(
        myAppController.userData != null &&
                myAppController.userData?['profile_complete']
            ? routeHomeBottomBar
            : routeLogin,
      ),
    );
  }
}
