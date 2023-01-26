import '../../general_exports.dart';

class HomeController extends GetxController {
  bool haveCars = true;

  void onAddNewCar() {
    haveCars = true;
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
