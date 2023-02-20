import 'package:dio/dio.dart';

import '../../../general_exports.dart';

class LoginController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? _fcmToken;

  bool isVisibility = true;

  bool isPhoneVerified = false;
  bool isGuest = true;
  bool viewOtp = false;
  FocusNode focusNode = FocusNode();
  bool rememberMe = false;

  final Dio _dio = Dio();

  @override
  Future<void> onInit() async {
    super.onInit();
    // _fcmToken = await FirebaseMessaging.instance.getToken();
    consoleLog(_fcmToken, key: 'fcm_token');
    update();
  }

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  bool emailValidator() {
    if (RegExp(validationEmail).hasMatch(emailController.text)) {
      return true;
    } else {
      showMessage(
          description: 'Please Enter a valid email',
          textColor: COMMON_RED_COLOR);
      return false;
    }
  }

  bool passwordValidator() {
    if (passwordController.text.length <= 6) {
      showMessage(
        description: 'Password should be longer or equal to 6 characters',
        textColor: COMMON_RED_COLOR,
      );
      return false;
    } else {
      return true;
    }
  }

  void loginValidator() {
    if (emailValidator() && passwordValidator()) {
      onUserLogin();
    }
    update();
  }

  void onPhoneChanged(String value) {
    isPhoneVerified = value.length == 9;
    isGuest = value.length != 9;
    update();
  }

  void updateRememberMe() {
    rememberMe = !rememberMe;
    update();
  }

  void onCompleteOTP(String value) {
    viewOtp = false;
    Get.toNamed(routeCompleteProfile);
    update();
  }

//* =========================== userLogin ================================ //

  Future<void> onUserLogin() async {
    hideKeyboard();
    if (signInValidation()) {
      // startLoading();
      ApiRequest(
        method: ApiMethods.post,
        path: '/login',
        className: 'LoginController',
        requestFunction: onUserLogin,
        withLoading: true,
        body: <String, dynamic>{
          'email': emailController.text,
          'password': passwordController.text,
          'fcm_token': _fcmToken,
        },
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          // consoleLog(response, key: 'response_user_data');
          myAppController.onUserAuthenticated(response[keyData]);
          // dismissLoading();
          Get.offAndToNamed(routeHomeBottomBar);

          // // dismissLoading();
          // if (data['user']['email_verified_at'] == null) {
          //   // myAppController.isVerified = false;
          // } else {
          //   // myAppController.isVerified = true;
          //   // homeBottomBarController = Get.put(HomeBottomBarController());
          //   // homeController = Get.put(HomeController());
          //   // myProfileController = Get.put(MyProfileController());
          //   // servicesController = Get.put(ServicesController());
          //   // materialsController = Get.put(MaterialsController());
          //   // myAppController = Get.put(MyAppController());
          //   // jobDiaryController = Get.put(JobDiaryController());
          //   // certificateController = Get.put(CertificateController());
          //   // Get.forceAppUpdate();
          //   Get.offAndToNamed(routeHomeBottomBar);
          // }
          // dismissLoading();
          // update();
          // // Get.offAndToNamed(routeHome);
        },
        // onError: (dynamic error) {
        //   dismissLoading();
        // },
      );
    }
    update();
  }

  Future<void> onRestoreAccount({required String path}) async {
    hideKeyboard();
    startLoading();
    await _dio.post(path).then(
      (dynamic value) {
        Get.back();
        Get.back();
        hideKeyboard();
        consoleLog(value);
        consoleLog('Success Restore');
        showMessage(description: 'Your account has been successfully restored');
        update();
        dismissLoading();
      },
    );
  }

  bool signInValidation() {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      showMessage(
        description: 'Please fill all the fields',
        textColor: COMMON_RED_COLOR,
      );
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    focusNode.dispose();
    super.onClose();
  }
}
