import '../../general_exports.dart';

class LoginController extends GetxController {
  bool isButtonEnable = false;
  TextEditingController inputController = TextEditingController();
  String oldValue = '';

  void onChangeInputValue(String? value) {
    final String trimValue = value!.trimLeft();
    final int valueLength = trimValue.length;

    if (valueLength == 2) {
      final bool isContain = oldValue.contains('-');
      final String firstSubString = trimValue.substring(0, 1);

      inputController.value = inputController.value.copyWith(
        text: isContain ? firstSubString : '$value-',
        selection: TextSelection(
          baseOffset: isContain ? firstSubString.length : '$value-'.length,
          extentOffset: isContain ? firstSubString.length : '$value-'.length,
        ),
      );

      oldValue = isContain ? firstSubString : '$value-';
    } else if (valueLength == 6) {
      final String itemValue = trimValue.substring(0, 5);
      final bool isContain = oldValue.split('-').length > 2;

      inputController.value = inputController.value.copyWith(
        text: isContain ? itemValue : '$value-',
        selection: TextSelection(
          baseOffset: isContain ? itemValue.length : '$value-'.length,
          extentOffset: isContain ? itemValue.length : '$value-'.length,
        ),
      );

      oldValue = isContain ? itemValue : '$value-';
    }
    isButtonEnable = valueLength == 10;

    update();
  }

  void test() {
    consoleLog(Get.arguments?[keyType]);
  }

  void onPressComplete() {
    hideKeyboard();
    Get.toNamed(
      routeOTP,
      arguments: <String, dynamic>{
        keyTitle: '05${inputController.text.replaceAll('-', '')}',
        keyType: Get.arguments?[keyType],
      },
    );
    consoleLog(inputController.text);
  }

  Future<void> onSendVerifyLogin() async {
    consoleLog(inputController.text.replaceAll('-', ''));
    hideKeyboard();
    startLoading();
    ApiRequest(
      method: ApiMethods.post,
      path: keySendOtp,
      className: 'LoginController/onVerifyLogin',
      requestFunction: onSendVerifyLogin,
      body: <String, dynamic>{
        'mobile': Get.arguments?[keyType] == LoginTypes.phone
            ? inputController.text.replaceAll('-', '')
            : '',
        'car_number': Get.arguments?[keyType] == LoginTypes.car
            ? inputController.text.replaceAll('-', '')
            : '',
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        Get.toNamed(
          routeOTP,
          arguments: <String, dynamic>{
            keyTitle: inputController.text.replaceAll('-', ''),
            keyType: Get.arguments?[keyType],
          },
        );
        dismissLoading();
      },
    );

    update();
  }
}
