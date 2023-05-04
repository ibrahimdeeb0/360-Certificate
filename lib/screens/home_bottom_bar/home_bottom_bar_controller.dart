import '../../general_exports.dart';

class HomeBottomBarController extends GetxController {
  int selectedIndex = 0;

  void onChangeIndex(int index) {
    selectedIndex = index;
    update();
    if (selectedIndex == 0) {
      certificatesController.scrollController.jumpTo(0.0);
    }
  }

  // @override
  // void onInit() {
  //   //  implement onInit
  //   super.onInit();
  //   selectedIndex = 0;
  //   update();
  // }
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
