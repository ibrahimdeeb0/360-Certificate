import '../../general_exports.dart';

class SubscriptionController extends GetxController {
  List<bool> isSelected = <bool>[false, false, true, true, false];

  int? lastIndex;
  void onChange(int index) {
    lastIndex = index;
    if (index == lastIndex) {
      isSelected[index] = true;
    } else {
      isSelected[index] = !isSelected[index];
    }

    for (int i = 0; i < isSelected.length; i++) {
      if (i != index) {
        isSelected[i] = false;
      }
    }

    update();
  }
}
