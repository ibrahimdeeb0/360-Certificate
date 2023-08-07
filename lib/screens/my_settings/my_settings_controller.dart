import 'package:image_picker/image_picker.dart';

import '../../general_exports.dart';

class MySettingsController extends GetxController {
  Map<String, dynamic> userData = <String, dynamic>{};
  Map<String, dynamic> mainUserData = <String, dynamic>{};
  XFile? compLogoFile;

  @override
  void onInit() {
    // userData = pro.allUserData['user'];
    userData = profileController.userProfileData;
    super.onInit();
  }

  final ImagePicker _picker = ImagePicker();
  Future<dynamic> pickerImage(ImageSource source) async {
    hideKeyboard();

    final XFile? file = await _picker.pickImage(
      source: source,
      imageQuality: 30,
    );

    if (file != null) {
      compLogoFile = file;
      update();
      if (Get.isBottomSheetOpen!) {
        Get.back();
      }
      updateCompanyLogo();
    } else {
      showMessage(
        description: 'No image has been uploaded',
        textColor: Colors.red[800],
      );
    }
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
}
