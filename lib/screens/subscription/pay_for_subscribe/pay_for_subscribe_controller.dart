import 'package:flutter/services.dart';

import '../../../general_exports.dart';

class PayForSubscribeController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController cardNumbController = TextEditingController();
  TextEditingController expireMonthController = TextEditingController();
  TextEditingController expireYearController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  TextEditingController nameCardController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  List<dynamic> allCountries = <dynamic>[];

  int? planId;
  SubscriptionController controller = Get.find<SubscriptionController>();

  bool isSaveCardInfo = false;

  void onToggleSaveCardInfo() {
    isSaveCardInfo = !isSaveCardInfo;
    update();
  }

  @override
  void onInit() {
    planId = controller.tabIndex == 0
        ? controller.selectedMonthPlane?.id
        : controller.selectedYearPlane?.id;

    consoleLog(planId, key: 'plan_Id');

    emailController.text = myAppController.userData['user']['email'];

    // getCountries();

    update();

    super.onInit();
  }

  void onChangeInputs(String? value) {
    // onValidationInputs();
  }

  bool isValid = false;
  String validMessage = '';

  void onValidationInputs() {
    hideKeyboard();
    if (emailController.text.trim().isNotEmpty) {
      if (cardNumbController.text.trim().isNotEmpty) {
        if (expireMonthController.text.trim().isNotEmpty) {
          if (expireYearController.text.trim().isNotEmpty) {
            if (cvcController.text.trim().isNotEmpty) {
              if (nameCardController.text.trim().isNotEmpty) {
                isValid = true;
                validMessage = '';
              } else {
                isValid = false;
                validMessage = 'Please type the name on card';
              }
            } else {
              isValid = false;
              validMessage = 'Please type CVC of card';
            }
          } else {
            isValid = false;
            validMessage = 'Please type expire Year of card';
          }
        } else {
          isValid = false;
          validMessage = 'Please type expire Month of card';
        }
      } else {
        isValid = false;
        validMessage = 'Please type card number';
      }
    } else {
      isValid = false;
      validMessage = 'Please type your email';
    }

    update();
  }

  void onPressComplete() {
    onValidationInputs();
    if (isValid) {
      onSubscribe();
    } else {
      flushbarMessage();
    }
  }

  Future<void> flushbarMessage() async {
    if (Get.isSnackbarOpen) {
      Get.back();
    } else {
      showMessage(
        description: validMessage,
        textColor: AppColors.redBold,
        fontSize: fontTitle,
        backgroundColor: Colors.grey.withOpacity(0.3),
      );
    }
  }

  void onSubscribe() {
    hideKeyboard();
    ApiRequest(
      method: ApiMethods.post,
      path: '/subscriptions',
      className: 'PayForSubscribeController/onSubscribe',
      requestFunction: onSubscribe,
      withLoading: true,
      body: <String, dynamic>{
        'plan': planId,
        'card_number': cardNumbController.text.trim().replaceAll(' ', ''),
        'card_exp_month': expireMonthController.text.trim().replaceAll(' ', ''),
        'card_exp_year': expireYearController.text.trim().replaceAll(' ', ''),
        'card_cvc': cvcController.text.trim().replaceAll(' ', ''),
        'card_name': nameCardController.text.trim(),
        'email': emailController.text.trim(),
        'country': 'GB'
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        homeController.getAllUserData();
        Get
          ..back()
          ..back()
          ..back();
        Get.bottomSheet(
          SubscribedMessageSheet(
            daysTrailer: homeController.trialDetails['remaining_days'] ?? 0,
          ),
        );
      },
      // onError: (dynamic error) {},
    );
  }

  Future<void> getCountries() async {
    hideKeyboard();
    if (allCountries.isEmpty) {
      ApiRequest(
        path: keyGetCountries,
        className: 'SearchWithWoozController/getCountries',
        requestFunction: getCountries,
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          allCountries = data;

          update();
        },
      );
    }
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final StringBuffer formatted = StringBuffer();
    String raw = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    while (raw.length >= 4) {
      formatted.write('${raw.substring(0, 4)} ');
      raw = raw.substring(4);
    }

    if (raw.isNotEmpty) {
      formatted.write(raw);
    }

    final String formattedText = formatted.toString().trim();

    // Check if the user is deleting characters
    if (oldValue.text.length > newValue.text.length) {
      // If the user is deleting a hyphen, move the cursor back by one
      int offset = newValue.selection.end - 1;
      if (offset < 0) {
        offset = 0;
      }
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: offset),
      );
    } else {
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
  }
}
