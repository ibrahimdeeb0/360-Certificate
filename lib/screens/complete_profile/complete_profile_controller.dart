import '../../general_exports.dart';

class CompleteProfileController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool isButtonEnable = false;
  bool viewGuides = false;
  bool isAccepted = false;

  void onPressComplete() {
    consoleLog(myAppController.userData);
    hideKeyboard();
    ApiRequest(
      method: ApiMethods.post,
      path: keyCompleteProfile,
      className: 'CompleteProfileController/onPressComplete',
      requestFunction: onPressComplete,
      body: <String, dynamic>{
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        viewGuides = true;
        update();
      },
    );
  }

  void onPressBack() {
    if (viewGuides) {
      viewGuides = false;
      update();
    } else {
      Get.back();
    }
  }

  void onChanged(String value) {
    isButtonEnable =
        firstNameController.text != '' && lastNameController.text != '';
    update();
  }

  void changeCheck() {
    isAccepted = !isAccepted;
    update();
  }

  void onLogin() {
    Get.offAllNamed(routeHomeBottomBar);
  }

  // @override
  // void onInit() {
  //   //  implement onInit
  //   super.onInit();
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
