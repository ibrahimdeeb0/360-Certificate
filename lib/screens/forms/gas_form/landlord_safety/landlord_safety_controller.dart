import '../../../../general_exports.dart';

class LandlordSafetyController extends GetxController {
  bool? isTemplate;

  int selectedId = 0;
  ScrollController scrollController = ScrollController();

  List<Widget> get listFormSections => <Widget>[
        // controller: Get.put(LandlordSafetyController())
        const LandlordPage1(),
        const LandlordPage2(),
        const LandlordPage3(),
        const LandlordPage4(),
        const LandlordPage5(),
      ];

  //* Circuit - Page Numbers *//
  String pagesNum() {
    if (selectedId == listFormSections.length) {
      return '${listFormSections.length}/${listFormSections.length}';
    } else {
      return '${selectedId + 1}/${listFormSections.length}';
    }
    // if (isTemplate!) {
    //   if (selectedId == listFormSections.length - 1) {
    //     return '${listFormSections.length - 1}/${listFormSections.length - 1}';
    //   } else {
    //     return '${selectedId + 1}/${listFormSections.length - 1}';
    //   }
    // } else {
    //   if (selectedId == listFormSections.length) {
    //     return '${listFormSections.length}/${listFormSections.length}';
    //   } else {
    //     return '${selectedId + 1}/${listFormSections.length}';
    //   }
    // }
  }

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
