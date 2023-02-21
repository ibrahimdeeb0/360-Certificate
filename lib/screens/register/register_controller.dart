import '../../general_exports.dart';

class RegisterController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<dynamic> allBusinessType = <dynamic>[];
  List<Map<String, dynamic>> selectedTempBusinessType =
      <Map<String, dynamic>>[];
  List<Map<String, dynamic>> selectedBusinessType = <Map<String, dynamic>>[];

  bool isVisibility = true;

  @override
  void onReady() {
    super.onReady();
    getBusinessType();
  }

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  // bool passwordValidator(String? value) {
  //   if (passwordController.text.length <= 6) {
  //     showMessage(
  //       description: 'Password should be longer or equal to 6 characters',
  //       textColor: COMMON_RED_COLOR,
  //     );
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  bool registerValidator() {
    final bool validation = firstNameController.text.trim().isNotEmpty &&
        lastNameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        phoneController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty &&
        selectedBusinessType.isNotEmpty;

    return validation;
  }

  void onSelectTempBusinessType(Map<String, dynamic> item) {
    if (selectedTempBusinessType.isEmpty) {
      selectedTempBusinessType.add(item);
    } else {
      if (selectedTempBusinessType
          .where((Map<String, dynamic> element) => element['id'] == item['id'])
          .isNotEmpty) {
        selectedTempBusinessType.removeWhere(
            (Map<String, dynamic> element) => element['id'] == item['id']);
      } else {
        selectedTempBusinessType.add(item);
      }
    }
    update();
    consoleLogPretty(selectedTempBusinessType);
  }

  void onSelectBusinessType() {
    selectedBusinessType = <Map<String, dynamic>>[];
    selectedBusinessType = selectedTempBusinessType;
    update();
    if (Get.isBottomSheetOpen!) {
      Get.back();
    }
  }

  Future<void> getBusinessType() async {
    hideKeyboard();
    ApiRequest(
      path: keyBusinessType,
      className: 'RegisterController/allBusinessType',
      requestFunction: getBusinessType,
      formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        allBusinessType = data;
        update();
      },
    );
  }

  void onRegister() {
    hideKeyboard();
    // startLoading();
    ApiRequest(
      shouldShowMessage: false,
      method: ApiMethods.post,
      path: register,
      className: 'RegisterController/onRegister',
      requestFunction: onRegister,
      withLoading: true,
      body: <String, dynamic>{
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phone': phoneController.text,
        'business_type_id':
            selectedBusinessType.map((dynamic item) => item['id']).toList(),
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        showMessage(description: response['message']);
        // Get.to(() => const EmailVerifyScreen());
        // dismissLoading();
        update();
      },
      onError: ((dynamic error) {
        consoleLogPretty(error['errors']);
        if (error['errors']['email'] != null &&
            error['errors']['password'] != null) {
          showMessage(
            description:
                '${error['errors']['email'][0]} \n ${error['errors']['password'][0]}',
            textColor: COMMON_RED_COLOR,
          );
        } else if ((error['errors']['email'] != null &&
            error['errors']['password'] == null)) {
          showMessage(
            description: '${error['errors']['email'][0]} \n',
            textColor: COMMON_RED_COLOR,
          );
        } else if ((error['errors']['email'] == null &&
            error['errors']['password'] != null)) {
          showMessage(
            description: '${error['errors']['password'][0]} \n',
            textColor: COMMON_RED_COLOR,
          );
        } else {
          showMessage(
            description: '${error['message']}\n',
            textColor: COMMON_RED_COLOR,
          );
        }
      }),
    );
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
