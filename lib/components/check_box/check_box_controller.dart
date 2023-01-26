import '../../general_exports.dart';

class CheckBoxController extends GetxController {
  bool isSelected = false;

  void changeSelection() {
    isSelected = !isSelected;
    consoleLog(isSelected);
    update();
  }
}
