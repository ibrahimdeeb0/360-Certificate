import '../../../../general_exports.dart';

class MinorWorksController extends GetxController {
  int selectedId = 0;
  ScrollController scrollController = ScrollController();

  List<Widget> get listFormSections => <Widget>[
        const MinorWorksPage1(),
        const MinorWorksPage2(),
        const MinorWorksPage3(),
        const MinorWorksPage4(),
      ];

  void onPress() {
    if (selectedId == listFormSections.length - 1) {
      // last screen
    } else {
      selectedId = selectedId + 1;
      update();
    }
    scrollController.jumpTo(0.0);
  }

  void onBack() {
    if (selectedId == 0) {
      // first screen
    } else {
      selectedId = selectedId - 1;
      update();
    }
    scrollController.jumpTo(0.0);
  }
}
