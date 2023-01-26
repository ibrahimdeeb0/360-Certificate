import 'dart:async';

import '../../general_exports.dart';

class OTPController extends GetxController {
  bool resendAvailable = false;
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  late Timer timer;
  int time = 65;

  bool isError = false;

  @override
  void onReady() {
    super.onReady();
    startTimer();
  }

  void activeResend() {
    timer.cancel();
    resendAvailable = true;
    update();
  }

  void resetTimer() {
    resetError();
    resendAvailable = false;
    time = 65;
    startTimer();
    update();
  }

  void startTimer() {
    const Duration oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (time == 0) {
          activeResend();
        } else {
          time--;
          update();
        }
      },
    );
  }

  void onVerifyLogin(String value) {
    resetError();
    startLoading();
    // Timer(
    //   const Duration(seconds: 1),
    //   () {
    //     if (value == '1234') {
    //       Get.toNamed(routeCompleteProfile);
    //     } else {
    //       isError = true;
    //       update();
    //     }
    //     dismissLoading();
    //   },
    // );

    ApiRequest(
      method: ApiMethods.post,
      path: keyVerifyOtp,
      className: 'OTPController/onVerifyLogin',
      requestFunction: onVerifyLogin,
      body: <String, dynamic>{
        'code': value,
        'mobile': Get.arguments?[keyTitle],
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.onUserAuthenticated(data);
        consoleLogPretty(data);
        if (data['profile_complete']) {
          Get.toNamed(routeHomeBottomBar);
        } else {
          Get.offAllNamed(routeCompleteProfile);
        }
        dismissLoading();
      },
      onError: (dynamic error) {
        isError = true;
        update();
        dismissLoading();
      },
    );
  }

  void resetError() {
    isError = false;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    timer.cancel();
  }
}
