import 'package:image_picker/image_picker.dart';

import '../../general_exports.dart';

class ProfileController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController currentPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();

  Map<String, dynamic> userProfileData = <String, dynamic>{};

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

  //!-------------

  void getUserProfileData({bool withLoading = true}) {
    ApiRequest(
      path: '/profile',
      className: 'ProfileController/getUserProfileData',
      requestFunction: getUserProfileData,
      withLoading: withLoading,
      formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        userProfileData = data['user'];
        setData();

        if (Get.isRegistered<MySettingsController>()) {
          Get.find<MySettingsController>().userData = userProfileData;
          Get.find<MySettingsController>().update();
        }
      },
    );
  }

  void setData() {
    firstNameController.text = userProfileData['first_name'];
    lastNameController.text = userProfileData['last_name'];
    phoneNumberController.text = userProfileData['phone'];
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
    ApiRequest(
      method: ApiMethods.put,
      path: keyProfileUpdate,
      className: 'MyProfileController/onUpdateProfileData',
      requestFunction: onUpdateProfileData,
      withLoading: true,
      body: <String, dynamic>{
        'first_name': firstNameController.text.isEmpty
            ? '${userProfileData['first_name']}'
            : firstNameController.text,
        'last_name': lastNameController.text.isEmpty
            ? '${userProfileData['last_name']}'
            : lastNameController.text,
        'email': '${userProfileData['email']}',
        'phone': firstNameController.text.isEmpty
            ? '${userProfileData['phone']}'
            : phoneNumberController.text,
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        showMessage(
          description: 'Success Edit Changes',
        );
        getUserProfileData();
        update();
      },
    );
  }

  final ImagePicker _picker = ImagePicker();
  XFile? fileImage;
  Future<dynamic> pickerFunction(ImageSource source) async {
    hideKeyboard();

    final XFile? file = await _picker.pickImage(
      source: source,
      imageQuality: 30,
    );

    if (file != null) {
      fileImage = file;
      update();
      if (Get.isBottomSheetOpen!) {
        Get.back();
      }
      onUpdateProfileImage();
    } else {
      showMessage(
        description: 'No image has been uploaded',
        textColor: Colors.red[800],
      );
    }
  }

  Future<void> onUpdateProfileImage() async {
    hideKeyboard();
    if (fileImage != null) {
      ApiRequest(
        path: '/profile/update-image',
        method: ApiMethods.post,
        className: 'ProfileController/onUpdateProfileImage',
        requestFunction: onUpdateProfileImage,
        body: await imageAsFormData(
          file: fileImage,
          fileKey: 'image',
        ),
        withLoading: true,
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          showMessage(
            description: 'Success Update Image',
          );
          getUserProfileData();
          update();
        },
      );
    } else {
      showMessage(
        description: 'Please upload an image',
        textColor: Colors.red[800],
      );
    }
  }
}
