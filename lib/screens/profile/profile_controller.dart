import 'package:image_picker/image_picker.dart';

import '../../general_exports.dart';

class ProfileController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController currentPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();

  Map<String, dynamic> userDataProfile = <String, dynamic>{};

  @override
  void onInit() {
    super.onInit();
    getProfileData();
  }

  void onPressNewPass() {
    final bool validInputsPass = currentPassController.text.isNotEmpty &&
        newPassController.text.isNotEmpty &&
        confirmNewPassController.text.isNotEmpty;

    if (validInputsPass) {
      onUpdatePassword();
    } else {
      showMessage(
        description: 'All Fields required',
        textColor: COMMON_RED_COLOR,
      );
    }
  }

  Future<void> getProfileData() async {
    hideKeyboard();
    ApiRequest(
      path: keyProfile,
      className: 'MyProfileController/getProfileData',
      requestFunction: getProfileData,
      // withLoading: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.localStorage.saveToStorage(
          key: 'getProfileData',
          value: data,
        );
        userDataProfile = data;
        setData();
        update();
      },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getProfileData',
      );
      userDataProfile = apiData;
      setData();
      update();
    }
  }

  void setData() {
    firstNameController.text = userDataProfile['first_name'];
    lastNameController.text = userDataProfile['last_name'];
    phoneNumberController.text = userDataProfile['phone'];
    update();
  }

  bool isEnablePass = false;
  void onCheckChangPass(String? value) {
    isEnablePass = currentPassController.text.isNotEmpty &&
        newPassController.text.isNotEmpty &&
        confirmNewPassController.text.isNotEmpty;

    update();
  }

  void onUpdatePassword() {
    hideKeyboard();
    startLoading();
    ApiRequest(
      method: ApiMethods.put,
      path: keyUpdatePassword,
      className: 'MyProfileController/onUpdatePassword',
      requestFunction: onUpdatePassword,
      body: <String, dynamic>{
        'current_password': currentPassController.text,
        'password': newPassController.text,
        'password_confirmation': confirmNewPassController.text,
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        dismissLoading();
        Get.back();
        update();
      },
    );
  }

  Future<void> onUpdateProfileData() async {
    hideKeyboard();
    // startLoading();
    if (fileImage == null) {
      ApiRequest(
        method: ApiMethods.put,
        path: keyProfileUpdate,
        className: 'MyProfileController/onUpdateProfileData',
        requestFunction: onUpdateProfileData,
        withLoading: true,
        body: <String, dynamic>{
          'first_name': firstNameController.text.isEmpty
              ? '${userDataProfile['first_name']}'
              : firstNameController.text,
          'last_name': lastNameController.text.isEmpty
              ? '${userDataProfile['last_name']}'
              : lastNameController.text,
          'email': '${userDataProfile['email']}',
          'phone': firstNameController.text.isEmpty
              ? '${userDataProfile['phone']}'
              : phoneNumberController.text,
        },
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          showMessage(
            description: 'Success Edit Changes',
          );
          getProfileData();
          if (Get.isRegistered<MySettingsController>()) {
            Get.find<MySettingsController>().getUserData();
          }

          update();
        },
      );
    } else {
      ApiRequest(
        method: ApiMethods.post,
        path: keyProfileUpdate,
        className: 'MyProfileController/onUpdateProfileData',
        requestFunction: onUpdateProfileData,
        withLoading: true,
        body: await addFormDataToJson(
          file: fileImage,
          jsonObject: <String, dynamic>{
            '_method': 'put',
            'first_name': firstNameController.text.isEmpty
                ? '${userDataProfile['first_name']}'
                : firstNameController.text,
            'last_name': lastNameController.text.isEmpty
                ? '${userDataProfile['last_name']}'
                : lastNameController.text,
            'email': '${userDataProfile['email']}',
            'phone': firstNameController.text.isEmpty
                ? '${userDataProfile['phone']}'
                : phoneNumberController.text,
          },
          fileKey: 'image',
        ),
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          showMessage(
            description: 'Success Edit Changes',
          );
          getProfileData();
          if (Get.isRegistered<MySettingsController>()) {
            Get.find<MySettingsController>().getUserData();
          }

          update();
        },
      );
    }
  }

  XFile? fileImage;
  Future<dynamic> pickerFunction(ImageSource source) async {
    await ImagePicker()
        .pickImage(
      source: source,
      maxWidth: DEVICE_WIDTH * 0.285,
      maxHeight: DEVICE_HEIGHT * 0.13,
    )
        .then(
      (XFile? value) {
        fileImage = value;
        update();
        Get.back();
        return null;
      },
    );
    update();
  }
}
