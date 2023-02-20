import '../../general_exports.dart';

class HomeBottomBarController extends GetxController {
  int selectedIndex = 0;

  void onChangeIndex(int index) {
    selectedIndex = index;
    update();
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
