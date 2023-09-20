import 'dart:async';

import '../../general_exports.dart';

class DeleteAccountController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Timer? myTimer;
  int startTime = 5;

  void fieldsValidation() {
    final bool validation = passwordController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;

    if (validation) {
      startTimer();
      Get.bottomSheet(
        const WarningBottomSheet(),
      );
    } else {
      showMessage(
        description: 'please, type password and description!',
        textColor: COMMON_RED_COLOR,
      );
    }
  }

  void startTimer() {
    resetTimer();
    const Duration oneSec = Duration(seconds: 1);
    myTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (startTime == 0) {
          timer.cancel();
          update();
        } else {
          startTime--;
          update();
        }
      },
    );
    update();
  }

  void resetTimer() {
    startTime = 5;
    update();
  }

  Future<void> onDeleteAccount() async {
    hideKeyboard();
    ApiRequest(
      method: ApiMethods.delete,
      path: keyDeleteAccount,
      className: 'DeleteAccountController/onDeleteAccount',
      requestFunction: onDeleteAccount,
      withLoading: true,
      body: <String, dynamic>{
        'password': passwordController.text,
        'message': descriptionController.text,
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.onSignOut();
        // update();
      },
    );
  }
}
