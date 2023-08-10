import '../../../../general_exports.dart';

class EditCertNoteController extends GetxController {
  dynamic imageData;

  @override
  void onInit() {
    imageData = Get.arguments[keyData];
    super.onInit();
  }
}
