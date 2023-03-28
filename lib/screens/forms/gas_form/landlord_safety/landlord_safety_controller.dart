import '../../../../general_exports.dart';

class LandlordSafetyController extends GetxController {
  bool? isTemplate;

  int selectedId = 0;
  ScrollController scrollController = ScrollController();

  List<Widget> get listFormSections => <Widget>[
        LandlordPage1(controller: Get.put(LandlordSafetyController())),
        LandlordPage2(controller: Get.put(LandlordSafetyController())),
        LandlordPage3(controller: Get.put(LandlordSafetyController())),
      ];

  void onNext() {
    if (listFormSections.length - 1 == selectedId) {
      consoleLog('Last Pages');
    } else {
      selectedId = selectedId + 1;
      update();
    }
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  void onPressBack() {
    if (selectedId > 0) {
      selectedId = selectedId - 1;
      update();
    } else {
      Get.back();
    }

    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  String finalPageButton() {
    if (selectedId < listFormSections.length - 1) {
      return 'Next';
    } else {
      return 'Complete';
    }
    // if (isTemplate!) {
    //   if (selectedId == 21) {
    //     return 'Save';
    //   } else {
    //     return 'Next';
    //   }
    // } else {
    //    if (selectedId < listFormSections.length - 1) {
    //     return 'Next';
    //   } else {
    //     return 'Complete';
    //   }
    // }
  }
}
