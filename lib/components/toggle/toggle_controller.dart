import '../../general_exports.dart';

class ToggleController extends GetxController {
  ToggleController({
    this.isSwitchOn = false,
    this.disabled = false,
  });

  bool? isSwitchOn;
  bool? disabled;

  void changeDisabledStatus(dynamic newState) {
    disabled = newState;
    update();
  }

  void onChangeSwitchStatus() {
    isSwitchOn = !isSwitchOn!;
    update();
  }
}
