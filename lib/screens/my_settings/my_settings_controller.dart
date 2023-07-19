import 'package:image_picker/image_picker.dart';

import '../../general_exports.dart';

class MySettingsController extends GetxController {
  Map<String, dynamic> userData = <String, dynamic>{};
  XFile? compLogoFile;

  @override
  void onReady() {
    super.onReady();
    userData = profileController.userDataProfile;
    update();
    // getUserData();
  }

  // Future<void> getUserData() async {
  //   hideKeyboard();
  //   ApiRequest(
  //     path: keyUserData,
  //     className: 'MySettingsController/getUserData',
  //     requestFunction: getUserData,
  //     withLoading: true,
  //     formatResponse: true,
  //   ).request(
  //     onSuccess: (dynamic data, dynamic response) {
  //       myAppController.localStorage.saveToStorage(
  //         key: 'getUserData',
  //         value: data,
  //       );
  //       userData = data['user'];
  //       update();
  //     },
  //   );
  //   if (!myAppController.isInternetConnect) {
  //     final dynamic apiData = await myAppController.localStorage.getFromStorage(
  //       key: 'getUserData',
  //     );
  //     userData = apiData['user'];
  //     update();
  //   }
  // }

  Future<dynamic> pickerImage(ImageSource source) async {
    hideKeyboard();
    await ImagePicker()
        .pickImage(
      source: source,
      imageQuality: 30,
    )
        .then(
      (XFile? value) {
        compLogoFile = value;
        update();
        if (Get.isBottomSheetOpen!) {
          Get.back();
        }
        updateCompanyLogo();
        return null;
      },
    );
    update();
  }

  Future<void> updateCompanyLogo() async {
    hideKeyboard();
    startLoading();
    ApiRequest(
      method: ApiMethods.post,
      path: apiUpdateCompanyLogo,
      className: 'MySettingsController/updateCompanyLogo',
      requestFunction: updateCompanyLogo,
      body: await imageAsFormData(file: compLogoFile),
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        profileController.getUserProfileData();
      },
      onError: (dynamic error) {
        dismissLoading();
      },
    );
    update();
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
