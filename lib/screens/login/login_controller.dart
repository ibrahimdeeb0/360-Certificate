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

  // @override
  // Future<void> onInit() async {
  //   super.onInit();
  //   // _fcmToken = await FirebaseMessaging.instance.getToken();
  //   // consoleLog(_fcmToken, key: 'fcm_token');
  //   update();
  // }

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
    // final RegExp letterRegExp = RegExp(r'[a-zA-Z]');
    // final RegExp numberRegExp = RegExp(r'[0-9]');
    // Check if the password contains at least one letter and one number
    // if (!letterRegExp.hasMatch(passwordController.text.trim()) ||
    //     !numberRegExp.hasMatch(passwordController.text.trim())) {}

    if (passwordController.text.length <= 5) {
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
    // consoleLog(signInValidation());
    if (signInValidation()) {
      // startLoading();
      ApiRequest(
        method: ApiMethods.post,
        path: '/login',
        className: 'LoginController',
        requestFunction: onUserLogin,
        withLoading: true,
        // shouldShowMessage: ,
        body: <String, dynamic>{
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
          'fcm_token': _fcmToken,
        },
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          consoleLog(data, key: 'response_Login');
          // myAppController.onUserAuthenticated(response[keyData]);

          if (data['user']['email_verified_at'] == null) {
            // email not verified
            Get.off(
              () => const VerifyAccount(),
              arguments: <String, dynamic>{
                'email': data['user']['email'].toString(),
              },
            );
          }
          // Complete profile is verified
          else if (data['isProfileComplete']) {
            myAppController.onUserAuthenticated(response[keyData]);

            homeBottomBarController = Get.put(HomeBottomBarController());
            homeController = Get.put(HomeController());
            profileController = Get.put(ProfileController());
            myAppController = Get.put(MyAppController());
            certificatesController = Get.put(CertificatesController());

            Get.offAllNamed(routeHomeBottomBar);
          }
          // Complete profile not ready
          else {
            myAppController.onUserAuthenticated(response[keyData]);

            Get.offAllNamed(
              routeCompleteProfile,
              arguments: <String, dynamic>{
                keyEmail: data['user']['email'],
                'f_name': data['user']['first_name'],
                'l_name': data['user']['last_name'],
              },
            );
          }
        },
        // onError: (dynamic error) {
        //   consoleLog('Error : $error', key: 'login_error');
        //   // dismissLoading();
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
        // consoleLog(value);
        // consoleLog('Success Restore');
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

  void onResetPassword() {
    hideKeyboard();
    ApiRequest(
      method: ApiMethods.post,
      path: '/rest-password',
      className: 'LoginController',
      requestFunction: onResetPassword,
      withLoading: true,
      body: <String, dynamic>{
        'email': emailController.text.trim(),
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        Get.back();
        showMessage(
          description: response['status'],
        );
      },
    );
  }

  @override
  void onClose() {
    focusNode.dispose();
    super.onClose();
  }
}
