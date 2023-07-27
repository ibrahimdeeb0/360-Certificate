import 'package:image_picker/image_picker.dart';

import '../../general_exports.dart';

class MySettingsController extends GetxController {
  Map<String, dynamic> userData = <String, dynamic>{};
  Map<String, dynamic> mainUserData = <String, dynamic>{};
  XFile? compLogoFile;

  @override
  void onReady() {
    super.onReady();
    userData = homeController.allUserData['user'];

    update();
  }

  // Future<void> getMainUserData() async {
  //   hideKeyboard();
  //   ApiRequest(
  //     path: keyProfile,
  //     className: 'MySettingsController/getMainUserData',
  //     requestFunction: getMainUserData,
  //     withLoading: true,
  //     formatResponse: true,
  //   ).request(
  //     onSuccess: (dynamic data, dynamic response) {
  //       mainUserData = data['user'];
  //       update();
  //     },
  //   );
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
        // profileController.getUserProfileData(); 
        homeController.getAllUserData();
      },
      onError: (dynamic error) {
        dismissLoading();
      },
    );
    update();
  }
}
