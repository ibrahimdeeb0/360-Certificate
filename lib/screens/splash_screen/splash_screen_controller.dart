import 'dart:async';

import '../../general_exports.dart';

class SplashController extends GetxController {
  bool showForceUpdate = false;
  @override
  Future<void> onReady() async {
    super.onReady();
    // if (myAppController.)
    Timer(
      const Duration(seconds: 2),
      () {
        consoleLog(myAppController.userData, key: 'inSplash');

        if (showForceUpdate) {
                // * this is the dialog to till user we have important update.
          openSimpleDialog(
            title: 'Update Available',
            btnText: 'Update Now',
            description:
                'Some important features of the app have been added, Please update the app to get these features.',
            onPress: () {},
            titleIcon: const Icon(
              Icons.update,
              size: 30,
            ),
            showScendBtn: true,
            onPressScendBtn: () {
              Get.offAndToNamed(
                // && myAppController.userData?['profile_complete']
                myAppController.userData != null
                    ? myAppController.userData['isProfileComplete']
                        ? routeHomeBottomBar
                        : routeCompleteProfile
                    : routeLogin,
              );
            },
            scendBtnText: 'Skip for now',
          );
        } else {
          Get.offAndToNamed(
            // && myAppController.userData?['profile_complete']
            myAppController.userData != null
                ? myAppController.userData['isProfileComplete']
                    ? routeHomeBottomBar
                    : routeCompleteProfile
                : routeLogin,
          );
        }
      },
    );
  }
}
