import 'package:flutter/services.dart';

import '../../general_exports.dart';

class HomeBottomBarController extends GetxController {
  int selectedIndex = 0;

  void onChangeIndex(int index) {
    selectedIndex = index;
    update();
    if (selectedIndex == 0) {
      if (certificatesController.scrollController.positions.isNotEmpty) {
        certificatesController.scrollController.jumpTo(0.0);
      }
    }
  }

  @override
  void onInit() {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();

    update();
  }
  // @override
  // void onReady() {
  //   //  implement onReady
  //   super.onReady();
  // }
  // @override
  // void onClose() {
  //   //  implement onClose
  //   super.onClose();
  // }
}
